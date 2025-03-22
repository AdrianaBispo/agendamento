import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

import 'package:agenda/modules/professional/data/dtos/professional_dto.dart';
import '../professional_datasource.dart';

class ProfessionalLocalDataSourceImpl implements ProfessionalDataSource {
  Database? _dataBase;
  final _professionaleStore = intMapStoreFactory.store('professional');
  

  ProfessionalLocalDataSourceImpl();

  Future _initDatabase() async {
    Directory _dir;
    if (_dataBase != null) return _dataBase;
    if (Platform.isAndroid || Platform.isIOS) {
      _dir = await getApplicationDocumentsDirectory();
    } else {
      _dir = await Directory.systemTemp.createTemp();
    }
    final dBPath = join(_dir.path, 'professional.db');
    _dataBase = await databaseFactoryIo.openDatabase(dBPath);
    return _dataBase;
  }

  @override
  Future<List<ProfessionalDto>> getAll() async {
    final finder = Finder(sortOrders: [
      SortOrder('name'),
    ]);
    final recordSnapshots = await _professionaleStore.find(
      await _initDatabase() as Database,
      finder: finder,
    );
    final result =  recordSnapshots.map((snapshot) {
      return ProfessionalDto.fromJson(snapshot.value);
    }).toList();
    return result;
  }

  @override
  Future<ProfessionalDto> getProfessional({required int id}) async {
    final filter = Finder(filter: Filter.equals('id', id));
    var dataBase = await _initDatabase() as Database;
    var snapshot = await _professionaleStore.query(finder: filter).getSnapshot(dataBase);
    final result = ProfessionalDto.fromJson(snapshot!.value);
    return result;
  }

  @override
  Future<void> deleteProfessional({required int id}) async {
    final find = Finder(filter: Filter.equals('id', id));
    var dataBase =  await _initDatabase() as Database;
    await _professionaleStore.delete(dataBase, finder: find);
  }

  @override
  Future<ProfessionalDto> updateProfessional({required ProfessionalDto professional}) async {
    final find = Finder(filter: Filter.equals('id', professional.idProfessional));
    var dataBase =  await _initDatabase() as Database;
    await _professionaleStore.update(dataBase, professional.toJson(), finder: find);
    var snapshot = await _professionaleStore.query(finder: find).getSnapshot(dataBase);
    final ProfessionalDto result = ProfessionalDto.fromJson(snapshot!.value);
    return result;
  }

  @override
  Future<ProfessionalDto> createProfessional({required ProfessionalDto professional}) async {
    var dataBase =  await _initDatabase() as Database;
    var find = Finder(
      filter: Filter.equals("id", null),
    );

    final result = await dataBase.transaction(
      (txn) async {
        var key = await _professionaleStore.add(txn, professional.toJson());
        await _professionaleStore.update(txn, {'id': key}, finder: find);
      },
    );
    return result;
  }

}

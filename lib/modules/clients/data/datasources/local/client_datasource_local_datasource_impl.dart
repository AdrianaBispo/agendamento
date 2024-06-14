import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

import 'package:agenda/modules/clients/data/dtos/client_dto.dart';
import '../client_datasource.dart';

class ClientLocalDataSourceImpl implements ClientDataSource {
  Database? _dataBase;
  final _clienteStore = intMapStoreFactory.store('clientes');
  late Directory _dir;

  ClientLocalDataSourceImpl();

  Future _initDb() async {
    if (_dataBase != null) return _dataBase;
    if (Platform.isAndroid || Platform.isIOS) {
      _dir = await getApplicationDocumentsDirectory();
    } else {
      _dir = await Directory.systemTemp.createTemp();
    }
    final dBPath = join(_dir.path, 'Clientes.db');
    _dataBase = await databaseFactoryIo.openDatabase(dBPath);
    return _dataBase;
  }

  @override
  Future<List<ClientDto>> getAll() async {
    //read
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      //ordem alfabetica
      SortOrder('name'),
    ]);
    final recordSnapshots = await _clienteStore.find(
      await _initDb() as Database,
      finder: finder,
    );

    // Making a List<ClientDto> out of List<RecordSnapshot>
    final result =  recordSnapshots.map((snapshot) {
      return ClientDto.fromJson(snapshot.value);
    }).toList();
    return result;
  }
}

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
  final _clientStore = intMapStoreFactory.store('client');

  ClientLocalDataSourceImpl();

  Future _initDatabase() async {
    Directory _dir;
    if (_dataBase != null) return _dataBase;
    if (Platform.isAndroid || Platform.isIOS) {
      _dir = await getApplicationDocumentsDirectory();
    } else {
      _dir = await Directory.systemTemp.createTemp();
    }
    final dBPath = join(_dir.path, 'client.db');
    _dataBase = await databaseFactoryIo.openDatabase(dBPath);
    return _dataBase;
  }

  @override
  Future<List<ClientDto>> getAll() async {
    var db = await _initDatabase() as Database;

    final recordSnapshots = await _clientStore.find(db);
    final result = recordSnapshots.map((snapshot) {
      return ClientDto.fromJson(snapshot.value);
    }).toList();
    return result;
  }

  @override
  Future<ClientDto> getClient({required int id}) async {
    var dataBase = await _initDatabase() as Database;
    final filter = Finder(filter: Filter.equals('id', id));

    var snapshot =
        await _clientStore.query(finder: filter).getSnapshot(dataBase);
    if (snapshot == null) {
      throw Exception();
    }
    final result = ClientDto.fromJson(snapshot.value);
    return result;
  }

  @override
  Future<void> deleteClient({required int id}) async {
    final find = Finder(filter: Filter.equals('id', id));
    var dataBase = await _initDatabase() as Database;
    await _clientStore.delete(dataBase, finder: find);
  }

  @override
  Future<ClientDto> updateClient({required ClientDto client}) async {
    final find = Finder(filter: Filter.equals('id', client.id));
    var dataBase = await _initDatabase() as Database;

    await _clientStore.update(dataBase, client.toJson(), finder: find);
    var snapshot = await _clientStore.query(finder: find).getSnapshot(dataBase);
    if (snapshot == null) {
      throw Exception();
    }
    final ClientDto result = ClientDto.fromJson(snapshot.value);
    return result;
  }

  @override
  Future<void> createClient({required ClientDto client}) async {
    var db = await _initDatabase() as Database;
    var find = Finder(
      filter: Filter.equals("id", null),
    );

    int key = await _clientStore.add(db, client.toJson());

    await _clientStore.update(db, {'id': key}, finder: find);
  }
}

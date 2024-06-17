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

  Future _initDatabase() async {
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
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      //ordem alfabetica
      SortOrder('name'),
    ]);
    final recordSnapshots = await _clienteStore.find(
      await _initDatabase() as Database,
      finder: finder,
    );

    // Making a List<ClientDto> out of List<RecordSnapshot>
    final result =  recordSnapshots.map((snapshot) {
      return ClientDto.fromJson(snapshot.value);
    }).toList();
    return result;
  }

  @override
  Future<ClientEntity> getClient({required int id}) {
    final filter = Finder(filter: Filter.equals('id', id));
    var dataBase = await _initDatabase() as Database;
    var snapshot = await _clienteStore.query(filter: find).findFirst(dataBase);
    final ClientDto result = ClientDto.fromJson(snapshot.value);
    return result;
  }

  @override
  Future<void> deleteClient({required int id}) async {
    final find = Finder(filter: Filter.equals('id', id));
    var dataBase =  await _initDatabase() as Database;
    await _clienteStore.delete(db, finder: find);
  }

  @override
  Future<ClientDto> updateClient({required ClientDto client}) {
    final find = Finder(filter: Filter.equals('id', client.id));
    var dataBase =  await _initDatabase() as Database;
    await _clienteStore.update(dataBase, client.toJson(), finder: find);
    var snapshot = await _clienteStore.query(finder: find).getSnapshot(dataBase);
    final ClientDto result = ClientDto.fromJson(snapshot.value);
    return result;
  }

  Future<ClientDto> createClient({required ClientDto client}) {
    var dataBase =  await _initDatabase() as Database;
    var find = Finder(
      filter: Filter.equals("id", null),
    );

    await dataBase.transaction(
      (txn) async {
        // Add the object, get the auto incremented id
        var key = await _clienteStore.add(txn, cliente.toJson());
        // Set the Id in our object
        await _clienteStore.update(txn, {'id': key}, finder: find);
      },
    );
  }

}

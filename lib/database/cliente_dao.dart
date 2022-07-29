import 'package:sembast/sembast.dart';
import 'package:sembast/utils/value_utils.dart';
import '../models/cliente.dart';
import 'data_help_cliente.dart';
import 'package:flutter/foundation.dart';

class ClienteDAO {
  
  final _clienteStore = intMapStoreFactory.store('clientes');

  Future<Database?> get _db async => await ClienteDatabase.instance.dataBase;

  insert(Cliente cliente) async {
    var db = await _db as Database;
    var find = Finder(
      filter: Filter.equals("id", null),
    );

    await db.transaction(
      (txn) async {
        // Add the object, get the auto incremented id
        var key = await _clienteStore.add(txn, cliente.toJson());
        // Set the Id in our object
        await _clienteStore.update(txn, {'id': key}, finder: find);
      },
    );
  }

  Future <List<Cliente>> getAllClientes() async {
    //read
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [//order alfabetica
      SortOrder('nome'),
    ]);

    final recordSnapshots = await _clienteStore.find(
      await _db as Database,
      finder: finder,
    );
    // Making a List<Cliente> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      return Cliente.fromJson(snapshot.value);
    }).toList();
  }

  getEpecificKey({required int id}) async {
    final find = Finder(filter: Filter.equals('id', id));

    var db = await _db as Database;
    var map = await _clienteStore.query(finder: find).getSnapshot(db);
    var historico = cloneValue(map);

    return historico.map((snapshot) {
      final clientes = Cliente.fromJson(snapshot.value);
      // An ID is a key of a record from the database.
      //fruit.id = snapshot.key;
      return clientes;
    }).toList();

  }

  Future updateCliente(int id, Cliente cliente) async {
    //update
    cliente.id = id;
    final find = Finder(filter: Filter.equals('id', id));

    var db = await _db as Database;
    await _clienteStore.update(db, cliente.toJson(), finder: find);

    await _clienteStore.query(finder: find).getSnapshot(db);
  }

  Future deleteCliente({required int id}) async {
    final find = Finder(filter: Filter.equals('id', id));
    var db = await _db as Database;
    await _clienteStore.delete(db, finder: find);
  }

}
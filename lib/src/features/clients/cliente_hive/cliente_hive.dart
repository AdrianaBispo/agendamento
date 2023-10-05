import 'dart:async';
import 'dart:developer';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

import 'client_adapter.dart';
//models
import 'models/cliente_database.dart';
import '../../../shared/models/cliente.dart';

class ClienteHive implements IClienteAdapter {
  final completer = Completer<Box>();

  ClienteHive() {
    _initDb();
  }
  Future _initDb() async {
    var appDocDirectory = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocDirectory.path)
      ..registerAdapter(
        ClienteDatabaseAdapter());

    log(Hive.isAdapterRegistered(10).toString());
    final box = await Hive.openBox('cliente');
    if (!completer.isCompleted) completer.complete(box);
    log('init');
  }

  @override
  Future<void> create(Cliente data) async {
    final box = await completer.future;
    box.put(box.length, data.toJson());
  }

  @override
  Future<List<Cliente>> readAllRegisters() async {
    final box = await completer.future;
    
    return box.keys.map((key) {
      final value = box.get(key);
      return Cliente.fromJson(value);
    }).toList();
  }

  
  @override
  Future<Cliente> readEpecificRegister({required int registerKey}) async {
    
    final box = await completer.future;
    final item = box.get(registerKey);
    return Cliente.fromJson(item);
  }

  @override
  Future<void> updateRegister(
      {required int registerKey, required Cliente data}) async {
    final box = await completer.future;
    await box.put(registerKey, data.toJson());
    readAllRegisters(); // Update the UI
  }

  @override
  Future<void> deleteRegister({required int registerKey}) async {
    final box = await completer.future;
    await box.delete(registerKey);
    readAllRegisters();
  }


  @override
  Future<Cliente?> get(int id) async {
    final box = await completer.future;
    final data = await box.get(id);

    if (data == null) return null;

    return Cliente(
      nome: data['nome'],
      sobrenome: data['sobrenome'],
      telefone: data['telefone'],
      dataNasciomento: data['dataNasciomento'],
      email: data['email'],
      historico: data['historico'],
/*          ? List.from(data['historico'])
              .map((e) => Historico.fromJson(e))
              .toList()
          : <Historico>[],
  */
    );
  }
}

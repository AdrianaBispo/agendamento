import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../shared/models/cliente.dart';


abstract class ClienteConsumer {
  void create(Cliente cliente) {}

  readAllRegisters() {}

  readEpecificRegister({required int id}) {}

  Future<void> updateRegister({
    required int itemKey,
    required Cliente cliente,
  }) async {}

  Future<void> deleteCliente({required int itemKey}) async {}
}

class ClienteConsumerImpl implements ClienteConsumer {
  final consumer = Hive.box('cliente_box');

  //Future<Database?> get _db async => await ClienteDatabase.instance.dataBase;

  @override
  void create(Cliente cliente) {
    final Cliente newClient = cliente;
    consumer.add(newClient.toJson());
  }

  @override
  readAllRegisters() {
    return consumer.keys.map((key) {
      final value = consumer.get(key);
      return Cliente.fromJson(value);
    }).toList();
  }

  @override
  readEpecificRegister({required int id}) async {
    final item = consumer.get(id);
    return item;
  }

  @override
  Future<void> updateRegister(
      {required int itemKey, required Cliente cliente}) async {
    await consumer.put(itemKey, cliente.toJson());
    readAllRegisters(); // Update the UI
  }

  @override
  Future<void> deleteCliente({required int itemKey}) async {
    await consumer.delete(itemKey);
    readAllRegisters();
  }
}

import '../../../shared/models/cliente.dart';

abstract class IAdapter {
  Future<void> create(Cliente data);

  Future<List<Cliente>> readAllRegisters();

  Future<Cliente> readEpecificRegister({required int registerKey});

  Future<void> updateRegister(
      {required int registerKey, required Cliente data});

  Future<void> deleteRegister({required int registerKey});

  Future<Cliente?> get(int id);
}


abstract class IClienteAdapter extends IAdapter {
  @override
  Future<void> create(Cliente data);

  @override
  Future<List<Cliente>> readAllRegisters();

  @override
  Future<Cliente> readEpecificRegister({required int registerKey});

  @override
  Future<void> updateRegister(
      {required int registerKey, required Cliente data});

  @override
  Future<void> deleteRegister({required int registerKey});

  @override
  Future<Cliente?> get(int id);
}

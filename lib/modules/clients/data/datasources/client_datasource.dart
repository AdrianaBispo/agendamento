import 'package:agenda/modules/clients/data/dtos/client_dto.dart';

abstract class ClientDataSource{
  Future<List<ClientDto>> getAll();
  Future<void> deleteClient(int id);
}
import 'package:agenda/modules/clients/data/dtos/client_dto.dart';

abstract class ClientDataSource{
  Future<List<ClientDto>> getAll();
  Future<void> deleteClient({required int id});
  Future<ClientDto> getClient({required int id});
  Future<ClientDto> updateClient({required ClientDto client});
  Future<void> createClient({required ClientDto client});
}
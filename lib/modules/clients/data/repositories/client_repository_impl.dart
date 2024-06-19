import 'package:agenda/modules/clients/domain/entities/client_entity.dart';
import 'package:agenda/modules/clients/domain/errors/error_client.dart';
import 'package:agenda/modules/clients/domain/repositories/client_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/client_datasource.dart';

class ClientRepositoryImpl implements ClientRepository {
  final ClientDataSource _clientLocalDataSource;

  ClientRepositoryImpl(this._clientLocalDataSource);

  @override
  Future<Either<FailureCreateClient, ClientEntity>> createClient(
      ClientEntity clientEntity) {
     try {
      final client = await _clientLocalDataSource.createClient(client: clientEntity);
      return Right(client);
    } catch (e) {
      throw Left(CreateClientsException(message: e.toString()));
    }

  @override
  Future<Either<FailureDeleteClient, void>> deleteClient(int id) async{
    try {
      await _clientLocalDataSource.deleteClient(id);
      return Right(null);
    } catch (e) {
      throw Left(DeleteClientsException(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureGetAllClients, List<ClientEntity>>>
      getAllClient() async {
    try {
      final List<ClientEntity>? result = await _clientLocalDataSource.getAll();
      if (result == null || result.isEmpty) {
        return const Right(<ClientEntity>[]);
      }
      return Right(result);
    } catch (e) {
      throw Left(GetAllClientsException(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureGetClient, ClientEntity>> getClient(int id) async{
    try {
      final ClientEntity client = await _clientLocalDataSource.getClient(id: id);
      return Right(client);
    } catch (e){
      throw Left(GetClientException(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureUpdateClient, ClientEntity>> updateClient(
      ClientEntity clientEntity) {
   try {
      final ClientEntity client = await _clientLocalDataSource.updateClient(client: clientEntity) 
      return Right(client);
    } catch (e){
      throw Left(UpdateClientException(message: e.toString()));
    }
  }
}

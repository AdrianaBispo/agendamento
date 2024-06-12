import 'package:agenda/modules/clients/domain/entities/client_entity.dart';
import 'package:agenda/modules/clients/domain/errors/error_client.dart';
import 'package:agenda/modules/clients/domain/repositories/client_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/client_datasource.dart';

class ClientRepositoryImpl implements ClientRepository {
  ClientDataSource _clientLocalDataSource;

  ClientRepositoryImpl(this._clientLocalDataSource);

  @override
  Future<Either<FailureCreateClient, ClientEntity>> createClient(
      ClientEntity clientEntity) {
    // TODO: implement createClient
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureDeleteClient, ClientEntity>> deleteClient(int id) {
    // TODO: implement deleteClient
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureGetAllClients, List<ClientEntity>>> getAllClient() async {
    final _clienteLocal = await _clientLocalDataSource.getAll();
    try {
      return Right(_clienteLocal);
    } catch (e) {
      return Left(GetAllClientsException());
    }
  }

  @override
  Future<Either<FailureGetClient, ClientEntity>> getClient(int id) {
    // TODO: implement getClient
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureUpdateClient, ClientEntity>> updateClient(
      ClientEntity clientEntity) {
    // TODO: implement updateClient
    throw UnimplementedError();
  }
}

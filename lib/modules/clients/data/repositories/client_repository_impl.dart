import 'package:agenda/modules/clients/domain/entities/client_entity.dart';
import 'package:agenda/modules/clients/domain/errors/error_client.dart';
import 'package:agenda/modules/clients/domain/repositories/client_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/client_datasource.dart';
import '../dtos/client_dto.dart';

class ClientRepositoryImpl implements ClientRepository {
  final ClientDataSource _clientLocalDataSource;

  ClientRepositoryImpl(this._clientLocalDataSource);

  @override
  Future<Either<FailureCreateClient, void>> createClient(
      {required ClientEntity clientEntity}) async {
    try {
      await _clientLocalDataSource.createClient(
          client: clientEntity as ClientDto);
      return const Right(null);
    } catch (e) {
      return Left(CreateClientException(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureDeleteClient, void>> deleteClient(
      {required int id}) async {
    try {
      await _clientLocalDataSource.deleteClient(id: id);
      return const Right(null);
    } catch (e) {
      return Left(DeleteClientsException(message: e.toString()));
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
      return Left(GetAllClientsException(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureGetClient, ClientEntity>> getClient(
      {required int id}) async {
    try {
      final ClientEntity? result =
          await _clientLocalDataSource.getClient(id: id);
      if (result == null) {
        return Left(
            GetClientException(message: 'Não foi encontrado o cliente'));
      }
      return Right(result);
    } catch (e) {
      return Left(GetClientException(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureUpdateClient, ClientEntity>> updateClient(
      {required ClientEntity clientEntity}) async {
    try {
      final ClientEntity client = await _clientLocalDataSource.updateClient(
          client: clientEntity as ClientDto);
      return Right(client);
    } catch (e) {
      return Left(UpdateClientException(message: e.toString()));
    }
  }
}

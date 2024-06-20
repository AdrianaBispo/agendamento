import 'package:dartz/dartz.dart';
import 'package:agenda/modules/clients/domain/entities/client_entity.dart';

import '../errors/error_client.dart';

abstract class ClientRepository {
  Future<Either<FailureGetAllClients, List<ClientEntity>>> getAllClient();
  Future<Either<FailureGetClient,ClientEntity>> getClient({required int id});
  Future<Either<FailureCreateClient,ClientEntity>> createClient({required ClientEntity clientEntity});
  Future<Either<FailureUpdateClient,ClientEntity>> updateClient({required ClientEntity clientEntity});
  Future<Either<FailureDeleteClient,void>> deleteClient({required int id});
}

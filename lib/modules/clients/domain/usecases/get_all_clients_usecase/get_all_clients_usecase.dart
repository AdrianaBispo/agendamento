import 'package:dartz/dartz.dart';

import '../../entities/client_entity.dart';
import '../../errors/error_client.dart';

abstract class GetallClientsUseCase{
 Future<Either<FailureGetAllClients, List<ClientEntity>>> call();
}
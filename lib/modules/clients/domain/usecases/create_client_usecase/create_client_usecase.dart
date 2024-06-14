import 'package:dartz/dartz.dart';

import '../../entities/client_entity.dart';
import '../../errors/error_client.dart';

abstract class CreateClientUseCase {
  Future<Either<FailureCreateClient, void>> call(ClientEntity clientEntity);
}

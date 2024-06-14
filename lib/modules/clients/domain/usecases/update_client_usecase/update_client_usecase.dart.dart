import 'package:agenda/modules/clients/domain/entities/client_entity.dart';
import 'package:dartz/dartz.dart';

import '../../errors/error_client.dart';

abstract class UpdateClientUseCase {
  Future<Either<FailureUpdateClient,ClientEntity>> call(ClientEntity cliente);
}
import 'package:dartz/dartz.dart';

import '../../entities/client_entity.dart';
import '../../errors/error_client.dart';

abstract class GetClientUseCase{
  Future<Either<FailureGetClient,ClientEntity>> call(int id);
}
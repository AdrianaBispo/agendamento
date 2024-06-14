import 'package:dartz/dartz.dart';

import '../../errors/error_client.dart';

abstract class DeleteClientUseCase {
  Future<Either<FailureDeleteClient,void>> call(int id);
}
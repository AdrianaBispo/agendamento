import 'package:dartz/dartz.dart';

import '../../errors/error_client.dart';

abstract class DeleteProfessionalUseCase {
  Future<Either<FailureDeleteProfessional,void>> call(int id);
}
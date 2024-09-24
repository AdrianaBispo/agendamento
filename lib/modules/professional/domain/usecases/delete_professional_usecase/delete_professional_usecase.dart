import 'package:dartz/dartz.dart';

import '../../errors/error_professional.dart';

abstract class DeleteProfessionalUseCase {
  Future<Either<FailureDeleteProfessional,void>> call(int id);
}
import 'package:dartz/dartz.dart';

import '../../errors/error_prossional.dart';

abstract class DeleteProfessionalUseCase {
  Future<Either<FailureDeleteProfessional,void>> call(int id);
}
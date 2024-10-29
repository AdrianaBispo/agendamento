import 'package:dartz/dartz.dart';

import '../../entities/professional_entity.dart';
import '../../errors/error_professional.dart';

abstract class CreateProfessionalUseCase {
  Future<Either<FailureCreateProfessional, void>> call(ProfessionalEntity professionalEntity);
}

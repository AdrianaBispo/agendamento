import 'package:agenda/modules/professional/domain/entities/professional_entity.dart';
import 'package:dartz/dartz.dart';

import '../../errors/error_professinal.dart';

abstract class UpdateProfessionalUseCase {
  Future<Either<FailureUpdateProfessional,ProfessionalEntity>> call(ProfessionalEntity professionalEntity);
}
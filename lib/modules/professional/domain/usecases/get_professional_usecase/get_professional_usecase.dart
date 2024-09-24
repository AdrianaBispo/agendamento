import 'package:dartz/dartz.dart';

import '../../entities/professional_entity.dart';
import '../../errors/error_professional.dart';

abstract class GetProfessionalUseCase{
  Future<Either<FailureGetProfessional,ProfessionalEntity>> call(int id);
}
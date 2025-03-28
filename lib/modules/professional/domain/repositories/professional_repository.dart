import 'package:dartz/dartz.dart';
import '../entities/professional_entity.dart';

import '../errors/error_professional.dart';

abstract class ProfessionalRepository {
  Future<Either<FailureGetAllProfessional, List<ProfessionalEntity>>> getAllProfessional();
  Future<Either<FailureGetProfessional,ProfessionalEntity>> getProfessional({required int id});
  Future<Either<FailureCreateProfessional,void>> createProfessional({required ProfessionalEntity professionalEntity});
  Future<Either<FailureUpdateProfessional,ProfessionalEntity>> updateProfessional({required ProfessionalEntity professionalEntity});
  Future<Either<FailureDeleteProfessional,void>> deleteProfessional({required int id});
}

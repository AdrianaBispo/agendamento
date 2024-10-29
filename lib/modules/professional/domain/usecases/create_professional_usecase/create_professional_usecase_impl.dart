import 'package:dartz/dartz.dart';

import '../../errors/error_professional.dart';
import '../../entities/professional_entity.dart';
import '../../repositories/professional_repository.dart';
import 'create_professional_usecase.dart';

class CreateProfessionalUseCaseImpl implements CreateProfessionalUseCase {
  final ProfessionalRepository _professional;

  CreateProfessionalUseCaseImpl(this._professional);

  @override
  Future<Either<FailureCreateProfessional, void>> call(ProfessionalEntity professionalEntity) async{
    return await _professional.createProfessional(professionalEntity: professionalEntity);
  }
}

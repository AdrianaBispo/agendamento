import 'package:agenda/modules/professional/domain/entities/professional_entity.dart';
import 'package:agenda/modules/professional/domain/errors/error_professional.dart';
import 'package:agenda/modules/professional/domain/repositories/professional_repository.dart';
import 'package:agenda/modules/professional/domain/usecases/update_professional_usecase/update_professional_usecase.dart.dart';
import 'package:dartz/dartz.dart';

class UpdateProfessionalUseCaseImpl implements UpdateProfessionalUseCase {
  final ProfessionalRepository _professionalRepository;

  UpdateProfessionalUseCaseImpl(this._professionalRepository);

  @override
  Future<Either<FailureUpdateProfessional, ProfessionalEntity>> call(ProfessionalEntity professionalEntity) async{
    return await _professionalRepository.updateProfessional(professionalEntity: professionalEntity);
  }

  
}
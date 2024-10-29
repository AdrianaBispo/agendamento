import 'package:agenda/modules/professional/domain/entities/professional_entity.dart';
import 'package:agenda/modules/professional/domain/errors/error_professional.dart';
import 'package:agenda/modules/professional/domain/repositories/professional_repository.dart';
import 'package:agenda/modules/professional/domain/usecases/get_professional_usecase/get_professional_usecase.dart';
import 'package:dartz/dartz.dart';

class GetProfessionalUseCaseImpl implements GetProfessionalUseCase{
  final ProfessionalRepository _professionalRepository;

  GetProfessionalUseCaseImpl(this._professionalRepository);

  @override
  Future<Either<FailureGetProfessional, ProfessionalEntity>> call(int id) async{
    return await _professionalRepository.getProfessional(id: id);
  }

}
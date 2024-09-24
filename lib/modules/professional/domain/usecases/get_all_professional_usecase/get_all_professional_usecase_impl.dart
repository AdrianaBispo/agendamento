import 'package:dartz/dartz.dart';

import '../../entities/professional_entity.dart';
import '../../errors/error_professional.dart';
import '../../repositories/professional_repository.dart';
  
import 'get_all_professional_usecase.dart';

class GetallProfessionalUseCaseImpl implements GetallProfessionalUseCase {
  final ProfessionalRepository _professionalRepository;

  GetallProfessionalUseCaseImpl(this._professionalRepository);

  @override
  Future<Either<FailureGetAllProfessional, List<ProfessionalEntity>>> call() async {
    return await _professionalRepository.getAllProfessional();
  }
}

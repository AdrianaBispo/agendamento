import 'package:dartz/dartz.dart';

import '../entities/professional_entity.dart';
import '../../errors/error_professional.dart';
import '../../repositories/professional_repository.dart';
import 'delete_client_usecase.dart';

class DeleteProfessionalUseCaseImpl implements DeleteProfessionalUseCase {
  final ProfessionalRepository _professionalRepository;

  DeleteProfessionalUseCaseImpl(this._professionalRepository);

  @override
  Future<Either<FailureDeleteClient,void>> call(int id) async{
    return await _professionalRepository.deleteProfessional(id: id);
  }
}
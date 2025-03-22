import 'package:agenda/modules/professional/domain/entities/professional_entity.dart';
import 'package:agenda/modules/professional/domain/errors/error_professional.dart';
import 'package:agenda/modules/professional/domain/repositories/professional_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/professional_datasource.dart';
import '../dtos/professional_dto.dart';

class ProfessionalRepositoryImpl implements ProfessionalRepository {
  final ProfessionalDataSource _professionalLocalDataSource;

  ProfessionalRepositoryImpl(this._professionalLocalDataSource);

  @override
  Future<Either<FailureCreateProfessional, void>> createProfessional(
      {required ProfessionalEntity professionalEntity}) async {
    try {
      await _professionalLocalDataSource.createProfessional(
          professional: professionalEntity as ProfessionalDto);
      return const Right(null);
    } catch (e) {
      return Left(CreateProfessionalException(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureDeleteProfessional, void>> deleteProfessional(
      {required int id}) async {
    try {
      await _professionalLocalDataSource.deleteProfessional(id: id);
      return const Right(null);
    } catch (e) {
      return Left(DeleteProfessionalException(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureGetAllProfessional, List<ProfessionalEntity>>>
      getAllProfessional() async {
    try {
      final List<ProfessionalEntity>? result =
          await _professionalLocalDataSource.getAll();
      if (result == null || result.isEmpty) {
        return const Right(<ProfessionalEntity>[]);
      }
      return Right(result);
    } catch (e) {
      return Left(GetAllProfessionalException(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureGetProfessional, ProfessionalEntity>> getProfessional(
      {required int id}) async {
    try {
      final ProfessionalEntity? result =
          await _professionalLocalDataSource.getProfessional(id: id);
      if (result == null) {
        return Left(GetProfessionalException(
            message: 'Não foi encontrado o profissional'));
      }
      return Right(result);
    } catch (e) {
      return Left(GetProfessionalException(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureUpdateProfessional, ProfessionalEntity>>
      updateProfessional(
          {required ProfessionalEntity professionalEntity}) async {
    try {
      final ProfessionalEntity professional =
          await _professionalLocalDataSource.updateProfessional(
              professional: professionalEntity as ProfessionalDto);
      return Right(professional);
    } catch (e) {
      return Left(UpdateProfessionalException(message: e.toString()));
    }
  }
}

import 'package:agenda/modules/professional/data/dtos/professional_dto.dart';

abstract class ProfessionalDataSource {
  Future<List<ProfessionalDto>> getAll();
  Future<void> deleteProfessional({required int id});
  Future<ProfessionalDto> getProfessional({required int id});
  Future<ProfessionalDto> updateProfessional({required ProfessionalDto client});
  Future<ProfessionalDto> createProfessional({required ProfessionalDto client});
}
import '../../../domain/repositories/professional_repository.dart';
import '../../../../service/dtos/service_dto.dart';
import '../../../data/dtos/professional_dto.dart';
import 'package:mobx/mobx.dart';

part 'professional_controller.g.dart';

class ProfessionalController = _ProfessionalStore with _$ProfessionalController;

abstract class _ProfessionalStore with Store {
  final ProfessionalRepository _repository;
  _ProfessionalStore(this._repository);

  @observable
  bool loading = false;

  @observable
  List<ProfessionalDto> repositories = [];

  @action
  Future<List<ProfessionalDto>> getAll() async {
    loading = true;
    final result = await _repository.getAllProfessional();

    if (result.isRight()) {
      result.fold(
        (failure) {
          repositories = [];
        },
        (right) {
          repositories = right.map((processional) {
            return ProfessionalDto(
              processional.id,
              nameProfessional: processional.name,
              professionProfessional: processional.profession,
              servicesProfessional: processional.services.map((service) {
                return ServiceDto(
                  descriptionDto: service.description,
                );
              }).toList(),
            );
          }).toList();
        },
      );
    }
    loading = false;
    return repositories;
  }
}

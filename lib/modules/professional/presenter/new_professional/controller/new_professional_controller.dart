import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:agenda/core/utils/validator.dart';
import '../../../domain/repositories/professional_repository.dart';
import '../../home/controller/professional_controller.dart';


import '../../../data/dtos/professional_dto.dart';

part 'new_professional_controller.g.dart';

class NewProfessionalController = _NewProfessionalStore with _$NewProfessionalController;

abstract class _NewProfessionalStore with Store {
  final validator = Validator();
  late List<ReactionDisposer> _disposers;
  FormErrorState error = FormErrorState();

  final ProfessionalRepository _repository;

  _NewProfessionalStore(this._repository);

  ProfessionalController professionalController = Modular.get<ProfessionalController>();

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @observable
  String name = '';

  @observable
  String profession = '';

  void initialState() {
    _disposers = [
      reaction((_) => name, validateNome),
      reaction((_) => profession, validateProfession),
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  @action
  void validateNome(String value) {
    error.name = Validator.isTextValid(value);
  }

  @action
  void validateProfession(String value) {
    error.profession = Validator.isTextValid(value);
  }

  @action
  Future<void> validateAll() async {
    validateNome(name);
    validateProfession(profession);

    if (error.hasErrors == false) {
      await _repository.createProfessional(
        professionalEntity: ProfessionalDto(
          null,
          nameProfessional: name,
          professionProfessional: profession,
          servicesProfessional: [],
        ),
      );
    }
    await professionalController.getAll();
  }
}

// ignore: library_private_types_in_public_api
class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? name;

  @observable
  String? profession;

  @computed
  bool get hasErrors => name != null || profession != null;
}

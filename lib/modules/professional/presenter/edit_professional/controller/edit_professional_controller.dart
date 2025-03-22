import 'package:agenda/core/utils/validator.dart';
import 'package:agenda/repository/validator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../data/dtos/professional_dto.dart';
import '../../../domain/repositories/professional_repository.dart';
import '../../home/controller/professional_controller.dart';
part 'edit_professional_controller.g.dart';


class EditProfessionalController = _EditProfessionalStore
    with _$EditProfessionalController;

abstract class _EditProfessionalStore with Store {
  final ProfessionalRepository _repository;
  late List<ReactionDisposer> _disposers;
  FormErrorState error = FormErrorState();
  final AppValidacaoTexto appValidacaoTexto = AppValidacaoTexto();

  late ProfessionalDto clientDto;

  ProfessionalController professionalController =
      Modular.get<ProfessionalController>();

  _EditProfessionalStore(this._repository);

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
    error.name = appValidacaoTexto.call(value);
  }

  @action
  void validateProfession(String value) {
    error.profession = Validator.isTextValid(value);
  }

  @action
  void validateAll() {
    validateNome(name);
    validateProfession(profession);
  }

  @action
  Future<void> update(ProfessionalDto processional) async {
    await _repository.updateProfessional(
      professionalEntity: processional,
    );
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

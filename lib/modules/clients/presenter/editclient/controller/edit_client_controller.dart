import 'package:agenda/modules/clients/data/dtos/client_dto.dart';
import '../../../../../core/utils/validator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../domain/repositories/client_repository.dart';
import '../../home/controller/client_controller.dart';

import 'package:mobx/mobx.dart';

part 'edit_client_controller.g.dart';

class ClientEditController = _ClientEditStore with _$ClientEditController;

abstract class _ClientEditStore with Store {
  final ClientRepository _repository;

  late List<ReactionDisposer> _disposers;
  FormErrorState error = FormErrorState();

  late ClientDto clientDto;

  ClientController clientController = Modular.get<ClientController>();

  _ClientEditStore(this._repository);

  @observable
  String name = '';

  @observable
  String telephone = '';

  void initialState() {
    _disposers = [
      reaction((_) => name, validateNome),
      reaction((_) => telephone, validateTelephone),
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  @action
  void validateNome(String value) {
    final AppValidacaoTexto appValidacaoTexto = AppValidacaoTexto();
    error.name = appValidacaoTexto.call(value);
  }

  @action
  void validateTelephone(String value) {
    final AppValidacaoTexto appValidacaoTexto = AppValidacaoTexto();
    error.telephone = appValidacaoTexto.call(value);
  }

  @action
  void validateAll() {
    validateNome(name);
    validateTelephone(telephone);
  }

  @action
  Future<void> update(ClientDto client) async {
    await _repository.updateClient(
      clientEntity: client,
    );
    await clientController.getAll();
  }
}

// ignore: library_private_types_in_public_api
class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? name;

  @observable
  String? telephone;

  @computed
  bool get hasErrors => name != null || telephone != null;
}

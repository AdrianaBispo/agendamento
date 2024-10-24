import 'dart:developer';
import 'package:agenda/core/utils/validator.dart';
import '../../../clients/data/dtos/client_dto.dart';
import '../../data/datasources/local/client_datasource_local_datasource_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'newclient_controller.g.dart';

class NewClientController = _NewClientStore with _$NewClientController;

abstract class _NewClientStore with Store {
  final validator = Validator();
  late List<ReactionDisposer> _disposers;
  FormErrorState error = FormErrorState();
  final ClientLocalDataSourceImpl clientLocalDataSource =  Modular.get<ClientLocalDataSourceImpl>();

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
    error.name = Validator.isTextValid(value);
  }

  @action
  void validateTelephone(String value) {
    error.telephone = Validator.isTelefoneValid(value);
  }

  @action
  void validateAll() {
    log('ValidateAll');
    validateNome(name);
    validateTelephone(telephone);

    if (error.hasErrors == false) {
      clientLocalDataSource.createClient(client: 
        ClientDto(
          null,
          nameClient: name,
          telephoneClient: telephone,
          historicClient: [],
        ),
      );
    }
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
  bool get hasErrors =>
      name != null ||
      telephone != null;
}

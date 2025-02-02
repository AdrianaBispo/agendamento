import 'package:agenda/modules/clients/data/dtos/client_dto.dart';

import '../../../../../core/utils/validator.dart';
import '../../../data/datasources/local/client_datasource_local_datasource_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../newclient/controller/newclient_controller.dart';

part 'edit_client_controller.g.dart';

class ClientEditController = _ClientEditStore with _$ClientEditController;

abstract class _ClientEditStore with Store {
  final ClientLocalDataSourceImpl clientLocalDataSource =
      Modular.get<ClientLocalDataSourceImpl>();

  final validator = Validator();
  late List<ReactionDisposer> _disposers;
  FormErrorState error = FormErrorState();

  late ClientDto clientDto;

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
    validateNome(name);
    validateTelephone(telephone);
  }

  @action
  void update(ClientDto client) {
    clientLocalDataSource.updateClient(
      client: client,
    );
  }
}

import 'dart:developer';
import 'package:agenda/models/historico.dart';
import 'package:all_validations_br/all_validations_br.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../shared/utils/validator.dart';
import 'package:mobx/mobx.dart';
//utils
import '../../../../shared/models/cliente.dart';
import '../../cliente_hive/client_adapter.dart';
part 'newclient_controller.g.dart';

class NewClientController = _NewClientStore with _$NewClientController;

abstract class _NewClientStore with Store {
  final validator = Validator();
  late List<ReactionDisposer> _disposers;
  FormErrorState error = FormErrorState();
  final IClienteAdapter clienteadapter = Modular.get();

  @observable
  String name = '';

  @observable
  String lastname = '';

  @observable
  String telephone = '';

  @observable
  String dateBirth = '';

  @observable
  String email = '';

  void initialState() {
    _disposers = [
      reaction((_) => name, validateNome),
      reaction((_) => lastname, validateLasteName),
      reaction((_) => telephone, validateTelephone),
      reaction((_) => dateBirth, validatedateBirth),
      reaction((_) => email, validateEmail),
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
  void validateLasteName(String value) {
    error.lastname = Validator.isTextValid(value);
  }

  @action
  void validateTelephone(String value) {
    error.telephone = Validator.isTelefoneValid(value);
  }

  @action
  void validatedateBirth(String value) {
    error.dateBirth = Validator.isDateValid(DateTime.parse(value));
  }

  @action
  validateEmail(String value) {
    error.email = Validator.isEmailValid(value);
  }

  @action
  void validateAll() {
    log('ValidateAll');
    validateNome(name);
    validateLasteName(lastname);
    validateTelephone(telephone);
    validatedateBirth(dateBirth);
    validateEmail(email);

    if (error.hasErrors == false) {
      clienteadapter.create(
        Cliente(
          nome: name,
          sobrenome: lastname,
          telefone: telephone,
          dataNasciomento: dateBirth,
          email: email,
          historico: [],
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
  String? lastname;

  @observable
  String? telephone;

  @observable
  String? dateBirth;

  @observable
  String? email;

  @computed
  bool get hasErrors =>
      name != null ||
      lastname != null ||
      telephone != null ||
      dateBirth != null ||
      email != null;
}
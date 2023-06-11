import '../../../../shared/utils/validator.dart';
import 'package:mobx/mobx.dart';
part 'clientehome_store.g.dart';

class ClienteHomeController = _ClienteHomeStore with _$ClienteHomeController;

abstract class _ClienteHomeStore with Store {
  final validator = Validator();
  late List<ReactionDisposer> _disposers;
  FormErrorState error = FormErrorState();

  @observable
  String nome = '';

  @observable
  String telefone = '';

  void initialState() {
    _disposers = [
      reaction((_) => nome, validateNome),
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
  void validateLasteName(String value){
    error.lastname = Validator.isTextValid(value);
  }

  @action 
  void validateTelephone(String value){
    error.telephone = Validator.isTelefoneValid(value);
  }

  @action
  void validateAll() {
    validateNome(nome);
    //validateLasteName(value);
    validateTelephone(telefone);
    /*
    if(error.hasErrors) {

    }
     */
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

  @computed
  bool get hasErrors => name != null || lastname != null || telephone != null;
}
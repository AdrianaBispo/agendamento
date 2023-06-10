import 'package:agenda/repository/validator.dart';
import 'package:mobx/mobx.dart';
part 'clientehome_store.g.dart';

class ClienteHomeController = _ClienteHomeStore with _$Controller;

abstract class _ClienteHomeStore with Store {
  final validator = Validator();
  late List<ReactionDisposer> _disposers;
  String? erroNome = '';

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
    erroNome = Validator.isTextValid(value);
  }
}

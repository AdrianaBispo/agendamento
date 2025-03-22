import 'package:all_validations_br/all_validations_br.dart';

abstract class AppValidacoes<T> {
  String? call(String? value);
}

class AppValidacaoTexto extends AppValidacoes {
  @override
  String? call(String? value) {
    if (value == null) {
      return 'Campo obrigatório';
    } else if (value.length < 5) {
      return 'Texto curto demais';
    } else if (value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }
}

class AppValidacaoTelefone extends AppValidacoes {
  @override
  String? call(String? value) {
    if (value == null) {
      return 'Campo obrigatório';
    } else if (AllValidations.isPhoneNumber(value) == false) {
      return 'Número de celular inválido';
    }
    return null;
  }
}

class AppValidacaoData extends AppValidacoes {
  @override
  String? call(String? value) {
    DateTime dataHoje = DateTime.now().toLocal();

    if (value.toString().isEmpty) {
      return 'Campo obrigatório';
    } else if (value == null) {
      return 'Campo obrigatório';
    } else if (DateTime.parse(value).isBefore(dataHoje)) {
      // data for é antes da data de hoje
      return 'Data invalida';
    }
    return null;
  }
}

class AppValidacaoEmail extends AppValidacoes {
  @override
  String? call(String? value) {
    if (value == null) {
      return 'Campo obrigatório';
    } else if (AllValidations.isEmail(value) == false) {
      return 'E-mail inválido';
    }
    return null;
  }
}

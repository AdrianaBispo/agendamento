import 'package:all_validations_br/all_validations_br.dart';

class Validator {
  static isTextValid(String? text) {
    if (text == null) {
      return 'Campo obrigatório';
    } else if (text.length < 5) {
      return 'Texto curto demais';
    } else if (text.isEmpty) {
      return 'Campo obrigatório';
    }
    return;
  }

  static isTelefoneValid(String? telefone) {
    if (telefone == null) {
      return 'Campo obrigatório';
    } else if (AllValidations.isPhoneNumber(telefone) == false) {
      return 'Número de celular inválido';
    }
    return null;
  }

  static isDateValid(DateTime data) {
    DateTime dataHoje = DateTime.now().toLocal();
    if (data.toString().isEmpty) {
      return 'Campo obrigatório';
    } else if (data.isBefore(dataHoje)) {
      // data for é antes da data de hoje
      return 'Data invalida';
    }
    return null;
  }

  static isEmailValid(String? email) {
    if (email == null) {
      return 'Campo obrigatório';
    } else if (AllValidations.isPhoneNumber(email) == false) {
      return 'E-mail inválido';
    }
    return null;
  }
}

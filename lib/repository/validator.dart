class Validator {
  static isTextValid({required String text}) {
    if (text.isEmpty) {
      return 'Campo obrigatório';
    } else if (text.length < 5) {
      return 'Texto curto demais';
    }
    return null;
  }

  static isTelefoneValid(String telefone) {
    if (telefone.isEmpty) {
      return 'Campo obrigatório';
    } else if (telefone.length < 11) {
      return 'Telefone muito pequeno';
    }
    return null;
  }

  static isDateValid(DateTime data) {
    DateTime dataHoje = DateTime.now().toLocal();
    if (data.toString().isEmpty) {
      return 'Campo obrigatório';
    }
    else if (data.isBefore(dataHoje)){// data for é antes da data de hoje
      return 'Data invalida';
    }
    return null;
  }
}

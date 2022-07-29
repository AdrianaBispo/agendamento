class Validator {
  static isTextValid(String? text) {
    if (text == null) {
      return 'Campo obrigatório';
    } else if (text.length < 5) {
      return 'Texto curto demais';
    } else if (text.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  static isTelefoneValid(String? telefone) {
    if (telefone == null) {
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
    } else if (data.isBefore(dataHoje)) {
      // data for é antes da data de hoje
      return 'Data invalida';
    }
    return null;
  }
}

class Agenda {
  String clienteNome;
  String clienteTelefone;
  String profissionalNome;
  String profissionalServico;
  DateTime horario;
  Agenda({
    required this.clienteNome,
    required this.clienteTelefone,
    required this.profissionalNome,
    required this.profissionalServico,
    required this.horario,
  });

  Map<String, dynamic> toJson() {
    return {
      'clienteNome': clienteNome,
      'clienteTelefone': clienteTelefone,
      'profissionalNome': profissionalNome,
      'profissionalServico': profissionalServico,
      'horario': horario,
    };
  }

  factory Agenda.fromJson(Map<String, dynamic> map) {
    return Agenda(
      clienteNome: map['clienteNome'],
      clienteTelefone: map['clienteTelefone'],
      profissionalNome: map['profissionalNome'],
      profissionalServico: map['profissionalServico'],
      horario: map['horario'],
    );
  }
}

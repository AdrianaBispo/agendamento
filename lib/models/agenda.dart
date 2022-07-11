class Agenda {
  int? id;
  String clienteNome;
  String clienteTelefone;
  String profissionalNome;
  String profissionalServico;
  DateTime horario;
  String data;
  Agenda({
    required this.clienteNome,
    required this.clienteTelefone,
    required this.profissionalNome,
    required this.profissionalServico,
    required this.horario,
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'clienteNome': clienteNome,
      'clienteTelefone': clienteTelefone,
      'profissionalNome': profissionalNome,
      'profissionalServico': profissionalServico,
      'horario': horario,
      'data': data,
    };
  }

  factory Agenda.fromJson(Map<String, dynamic> map) {
    return Agenda(
      clienteNome: map['clienteNome'],
      clienteTelefone: map['clienteTelefone'],
      profissionalNome: map['profissionalNome'],
      profissionalServico: map['profissionalServico'],
      horario: map['horario'],
      data: map['data'],
    );
  }
}

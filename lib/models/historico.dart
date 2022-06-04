class Historico{
  final String profissionalNome;
  final String servico;
  Historico({
    required this.profissionalNome,
    required this.servico,
  });
  Map<String, String> toJson() {
    //convert para map
    return {
      'profissionalNome': profissionalNome,
      'servico': servico,
    };
  }

  factory Historico.fromJson(Map<String, dynamic> map) {
    //toJson
    return Historico(
      profissionalNome: map['profissionalNome'], 
      servico: map['servico'],
      );
  }
}
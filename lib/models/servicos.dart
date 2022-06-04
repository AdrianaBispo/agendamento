class Servicos{
  late String nome;
  late String duracao;

  Servicos({
    required this.nome,
    required this.duracao,
  });
Map<String, String> toJson() {
    //convert para map
    return {
      'nome': nome,
      'duracao': duracao,
    };
  }

  factory Servicos.fromJson(Map<String, dynamic> map) {
    //toJson
    return Servicos(
      nome: map['nome'], 
      duracao: map['duracao'],
      );
  }
  }
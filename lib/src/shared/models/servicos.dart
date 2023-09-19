class Servicos{
  String nome;

  Servicos({
    required this.nome,
  });
Map<String, String> toJson() {
    //convert para map
    return {
      'nome': nome,
    };
  }

  factory Servicos.fromJson(Map<String, dynamic> map) {
    //toJson
    return Servicos(
      nome: map['nome'], 
      );
  }
  }
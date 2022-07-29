import 'historico.dart';

class Cliente{
  int? id;
  String nome;
  String telefone;
  List<Historico> historico;
  Cliente({
    required this.nome,
    required this.telefone,
    required this.historico,
  });
  Map<String, dynamic> toJson() {
    return{
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'historico': historico.map((historic) => historic.toJson()).toList(),
    };
  }
  factory Cliente.fromJson(Map<String, dynamic> map) {
    return Cliente(
      nome: map['nome'],
      telefone: map['telefone'],
      historico: map['historico'] != null ? List.from(map['historico']).map((e) => Historico.fromJson(e)).toList()
      : <Historico>[],
    );
  }
}
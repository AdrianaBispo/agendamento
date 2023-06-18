import 'historico.dart';

class Cliente {
  int? id;
  String nome;
  String sobrenome;
  String telefone;
  String dataNasciomento;
  String email;
  List<Historico> historico;
  Cliente({
    required this.nome,
    required this.sobrenome,
    required this.telefone,
    required this.dataNasciomento,
    required this.email,
    required this.historico,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'sobrenome': sobrenome,
      'telefone': telefone,
      'dataNasciomento': dataNasciomento,
      'email': email,
      'historico': historico.map((historic) => historic.toJson()).toList(),
    };
  }

  factory Cliente.fromJson(Map<String, dynamic> map) {
    return Cliente(
      nome: map['nome'],
      sobrenome: map['sobrenome'],
      telefone: map['telefone'],
      dataNasciomento: map['dataNasciomento'],
      email: map['email'],
      historico: map['historico'] != null
          ? List.from(map['historico'])
              .map((e) => Historico.fromJson(e))
              .toList()
          : <Historico>[],
    );
  }
}

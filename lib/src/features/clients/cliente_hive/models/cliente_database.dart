import 'package:hive/hive.dart';
import '../../../../shared/models/cliente.dart';
import '../../../../shared/models/historico.dart';
part 'cliente_database.g.dart';

@HiveType(typeId: 100)
class ClienteDatabase extends HiveObject implements Cliente {
  @HiveField(0)
  @override
  int? id;

  @HiveField(1)
  @override
  String nome;

  @HiveField(2)
  @override
  String sobrenome;

  @HiveField(3)
  @override
  String telefone;

  @HiveField(4)
  @override
  String dataNasciomento;

  @HiveField(5)
  @override
  String email;

  @HiveField(6)
  @override
  List<Historico> historico;

  ClienteDatabase({
    required this.nome,
    required this.sobrenome,
    required this.telefone,
    required this.dataNasciomento,
    required this.email,
    required this.historico,
  });

  @override
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

  @override
  factory ClienteDatabase.fromJson(Map<String, dynamic> map) {
    return ClienteDatabase(
      nome: map['nome'],
      sobrenome: map['sobrenome'],
      telefone: map['telefone'],
      dataNasciomento: map['dataNasciomento'],
      email: map['email'],
      historico: map['historico'] != null
          ? List.from(map['historico'])
              .map((e) => Historico.fromJson(e))
              .toList()
          : <Historico>[]
    );

  }
}


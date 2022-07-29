import 'servicos.dart';

class Profissional {
  int? id;
  String nome;
  String profissao;
  List<Servicos> servicos;

  Profissional({
    this.id,
    required this.nome,
    required this.profissao,
    required this.servicos,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'profissao': profissao,
      'servicos': servicos.map((historic) => historic.toJson()).toList(),
    };
  }

  factory Profissional.fromJson(Map<String, dynamic> map) {
    return Profissional(
      id: map['id'],
      nome: map['nome'],
      profissao: map['profissao'],
      servicos: map['servicos'] != null
          ? List.from(map['servicos'])
              .map((e) => Servicos.fromJson(e))
              .toList() //cria lista apartir da var
          : <Servicos>[],
    );
  }
}

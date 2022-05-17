import 'servicos.dart';

class Profissional{
  late String nome;
  late String profissao;
  late List<Servicos> servicos;

  Profissional({
    required this.nome,
    required this.profissao,
    required this.servicos,
  });
}
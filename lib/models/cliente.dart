import 'historico.dart';

class Cliente{
  final String nome;
  final String telefone;
  final List<Historico> historico;
  Cliente({
    required this.nome,
    required this.telefone,
    required this.historico,
  });
}
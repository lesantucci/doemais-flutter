import 'package:doemais/commons/models/endereco.model.dart';

class Ong {
  final String id;
  final String nome;
  final String descricao;
  final String email;
  final dynamic dataInicial;
  final dynamic dataFinal;
  final int categoria;
  final Map endereco;
  final bool favorito;
  final int campanhasAtivas;
  final int campanhasEncerradas;
  final Map imagens;
  final Map agenda;

  Ong(
      {required this.id,
      required this.nome,
      required this.descricao,
      required this.favorito,
      required this.campanhasAtivas,
      required this.campanhasEncerradas,
      required this.email,
      required this.dataInicial,
      required this.dataFinal,
      required this.categoria,
      required this.endereco,
      required this.imagens,
      required this.agenda});

  factory Ong.fromJson(Map json) {
    return Ong(
        id: json['uid'],
        nome: json['nome'],
        descricao: json['descricao'],
        favorito: json['favorito'],
        campanhasAtivas: json['campanhasAtivas'],
        campanhasEncerradas: json['campanhasAtivas'],
        email: json['email'],
        dataFinal: json['dataFinal'],
        dataInicial: json['dataInicial'],
        categoria: json['categoria'],
        endereco: json['endereco'],
        imagens: json['imagens'],
        agenda: json['agenda']);
  }
}

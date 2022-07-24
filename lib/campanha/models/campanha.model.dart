import 'package:doemais/commons/models/agenda.model.dart';
import 'package:doemais/commons/models/endereco.model.dart';

class Campanha {
  final String id;
  final Map ong;
  final String nome;
  final String descricao;
  final Map imagens;
  final Endereco endereco;
  final int apoiadores;
  final bool apoio;
  final Agenda agenda;
  final String dataInicial;
  final String dataFinal;
  final int categoria;
  final int status;

  Campanha(
      {required this.id,
      required this.ong,
      required this.nome,
      required this.descricao,
      required this.imagens,
      required this.endereco,
      required this.apoiadores,
      required this.apoio,
      required this.agenda,
      required this.dataInicial,
      required this.dataFinal,
      required this.categoria,
      required this.status});
  factory Campanha.fromJson(Map<String, dynamic> json) {
    return Campanha(
        id: json['_id'],
        ong: json['ong'],
        nome: json['nome'],
        descricao: json['descricao'],
        imagens: json['imagens'],
        endereco: Endereco.fromJson(json['endereco']),
        apoiadores: json['apoiadores'],
        apoio: json['apoio'],
        agenda: Agenda.fromJson(json['agenda']),
        dataInicial: json['dataInicial'],
        dataFinal: json['dataFinal'],
        categoria: json['categoria'],
        status: json['status']);
  }
}
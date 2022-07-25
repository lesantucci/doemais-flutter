import 'package:doemais/commons/models/agenda.model.dart';

class Ong {
  String id = '';
  String nome = '';
  String descricao = '';
  String email = '';
  dynamic dataInicial = '';
  dynamic dataFinal = '';
  int categoria = 0;
  Map endereco = {};
  bool favorito = false;
  int campanhasAtivas = 0;
  int campanhasEncerradas = 0;
  Map imagens = {};
  Agenda agenda = Agenda(atividade: [], horaInicio: '', horaFim: '');

  Ong();

  factory Ong.fromJson(Map json) {
    Ong ong = Ong();
    ong.id = json['uid'];
    ong.nome = json['nome'];
    ong.descricao = json['descricao'];
    ong.favorito = json['favorito'];
    ong.campanhasAtivas = json['campanhasAtivas'];
    ong.campanhasEncerradas = json['campanhasEncerradas'];
    ong.email = json['email'];
    ong.dataFinal = json['dataFinal'];
    ong.dataInicial = json['dataInicial'];
    ong.categoria = json['categoria'];
    ong.endereco = json['endereco'];
    ong.imagens = json['imagens'];
    ong.agenda = Agenda.fromJson(json['agenda']);
    return ong;
  }
}

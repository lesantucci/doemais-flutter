import 'package:doemais/commons/models/agenda.model.dart';
import 'package:doemais/commons/models/endereco.model.dart';

class Campanha {
  String id = '';
  dynamic ong = '';
  String ongNome = '';
  String nome = '';
  String descricao = '';
  Map imagens = {};
  Endereco endereco = const Endereco(
      cep: 'cep',
      logradouro: 'logradouro',
      complemento: 'complemento',
      bairro: 'bairro',
      localidade: "localidade",
      uf: 'uf',
      latitude: 'latitude',
      longitude: 'longitude');
  int apoiadores = 0;
  bool apoio = false;
  Agenda agenda =
      const Agenda(atividade: [], horaInicio: 'horaInicio', horaFim: 'horaFim');
  String dataInicial = '';
  String dataFinal = '';
  int categoria = 0;
  int status = 0;

  Campanha();

  factory Campanha.fromJson(Map<String, dynamic> json) {
    Campanha campanha = Campanha();
    campanha.id = json['_id'];
    campanha.ong = json['ong'];
    campanha.ongNome = json['ongNome'];
    campanha.nome = json['nome'];
    campanha.descricao = json['descricao'];
    campanha.imagens = json['imagens'];
    campanha.endereco = Endereco.fromJson(json['endereco']);
    campanha.apoiadores = json['apoiadores'];
    campanha.apoio = json['apoio'];
    campanha.agenda = Agenda.fromJson(json['agenda']);
    campanha.dataInicial = json['dataInicial'];
    campanha.dataFinal = json['dataFinal'];
    campanha.categoria = json['categoria'];
    campanha.status = json['status'];
    return campanha;
  }
}

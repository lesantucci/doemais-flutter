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
  Map agenda = {};

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
    ong.agenda = json['agenda'];
    return ong;
  }
}

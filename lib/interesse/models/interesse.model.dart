class Interesse {
  final String id;
  final String nome;
  final String descricao;
  final Map<String, dynamic> imagens;
  final String dataInicial;
  final String dataFinal;
  final bool apoio;

  const Interesse(
      {required this.id,
      required this.nome,
      required this.descricao,
      required this.imagens,
      required this.dataInicial,
      required this.dataFinal,
      required this.apoio});

  factory Interesse.fromJson(Map<String, dynamic> json) {
    return Interesse(
        id: json['_id'],
        nome: json['nome'],
        descricao: json['descricao'],
        imagens: json['imagens'],
        dataInicial: json['dataInicial'],
        dataFinal: json['dataFinal'],
        apoio: json['apoio']);
  }
}

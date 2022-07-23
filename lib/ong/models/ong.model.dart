class Ong {
  final int id;
  final String titulo;
  final String descricao;
  final bool favorito;
  final int campanhasAtivas;
  final int campanhasEncerradas;

  Ong(
      {required this.id,
      required this.titulo,
      required this.descricao,
      required this.favorito,
      required this.campanhasAtivas,
      required this.campanhasEncerradas});

  factory Ong.fromJson(Map<String, dynamic> json) {
    return Ong(
        id: json['id'],
        titulo: json['titulo'],
        descricao: json['descricao'],
        favorito: json['apoio'],
        campanhasAtivas: json['campanhasAtivas'],
        campanhasEncerradas: json['campanhasAtivas']);
  }
}

List<Ong> allOngs = [
  Ong(
      id: 1,
      titulo: "SPASO - Associação Protetora Dos Animais",
      descricao:
          "A SPASO é uma entidade sem fins lucrativos, que se mantém com a ajuda de seus colaboradores e através de doações.",
      favorito: false,
      campanhasAtivas: 1,
      campanhasEncerradas: 10),
  Ong(
      id: 2,
      titulo: "PET SHOP DA ESQUINA",
      descricao:
          "Pet shop dos truta da quebrada que ajuda os cachorros e gatos da região.",
      favorito: true,
      campanhasAtivas: 2,
      campanhasEncerradas: 3)
];

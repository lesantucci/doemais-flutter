class CategoriaOng {
  final String titulo;
  final int id;
  bool checked = false;

  CategoriaOng({required this.titulo, required this.id});

  factory CategoriaOng.fromJson(Map json) {
    return CategoriaOng(titulo: json['descricao'], id: json['id']);
  }
}

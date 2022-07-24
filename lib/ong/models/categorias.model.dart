class CategoriaOng {
  final String titulo;
  final int id;
  bool checked;

  CategoriaOng({required this.titulo, required this.checked, required this.id});
}

List<CategoriaOng> Allcategorias = [
  CategoriaOng(titulo: "Assistência Social", checked: false, id: 1),
  CategoriaOng(titulo: "Cultura", checked: false, id: 2),
  CategoriaOng(titulo: "Saúde", checked: false, id: 3),
  CategoriaOng(titulo: "Meio Ambiente", checked: false, id: 4),
  CategoriaOng(
      titulo: "Desenvolvimento e Defesa de direitos", checked: false, id: 5),
  CategoriaOng(titulo: "Habitação", checked: false, id: 6),
  CategoriaOng(titulo: "Educação e Pesquisa", checked: false, id: 7),
];

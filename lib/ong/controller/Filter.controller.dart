import 'package:flutter/material.dart';

import '../models/categorias.model.dart';
import '../models/ong.model.dart';
import '../services/ong.service.dart';

class FilterController extends ChangeNotifier {
  late List<Ong> lista;
  List<Ong> listaFiltrada = [];
  List<int> categoriaFiltrada = [];
  final OngService ongService = OngService();
  bool onlyFav = false;

  FilterController() {
    ongService.pesquisar().then(
      (list) {
        lista = list;
        listaFiltrada = list;
        notifyListeners();
      },
    );
  }

  void searchOng(String query) {
    final suggestions = lista.where((ong) {
      final titulo = ong.nome.toLowerCase();
      final input = query.toLowerCase();

      return titulo.contains(input);
    }).toList();

    listaFiltrada = suggestions;
    notifyListeners();
  }

  void searchOngByCategory(CategoriaOng categoriaOng) {
    var suggestions = lista;
    if (categoriaOng.checked) {
      categoriaFiltrada.add(categoriaOng.id);
    } else {
      categoriaFiltrada.remove(categoriaOng.id);
    }
    if (categoriaFiltrada.isNotEmpty) {
      suggestions = lista.where((ong) {
        return categoriaFiltrada.contains(ong.categoria);
      }).toList();
    }
    listaFiltrada = suggestions;

    notifyListeners();
  }

  void searchOngByFav() {
    onlyFav = !onlyFav;
    if (onlyFav) {
      final suggestions = lista.where((ong) {
        return ong.favorito;
      }).toList();
      listaFiltrada = suggestions;
    }
    notifyListeners();
  }
}

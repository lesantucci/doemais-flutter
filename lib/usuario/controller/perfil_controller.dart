import 'package:doemais/usuario/models/usuario.model.dart';
import 'package:flutter/material.dart';

class PerfilController extends ChangeNotifier {
  static PerfilController instance = PerfilController();

  int screenIndex = 0;
  Usuario usuario = Usuario();

  static int perfilDetalheScreen = 0;
  static int perfilEditarScreen = 1;

  changePage(int index) {
    screenIndex = index;

    notifyListeners();
  }

  changeUsuario(Usuario value) {
    var nomes = value.nome.split(" ");
    var iniciais = "";

    iniciais = nomes[0].substring(0, 1).toUpperCase();

    if (nomes.length > 1) {
      iniciais = iniciais + nomes[1].substring(0, 1).toUpperCase();
    }

    value.iniciais = iniciais;
    usuario = value;

    notifyListeners();
  }
}

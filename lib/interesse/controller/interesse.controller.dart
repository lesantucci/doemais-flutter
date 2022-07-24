import 'package:doemais/interesse/models/interesse.model.dart';
import 'package:flutter/material.dart';

class InteresseController extends ChangeNotifier {
  static InteresseController instance = InteresseController();

  List<Interesse> lista = List.empty();

  void changeLista(List<Interesse> value) {
    lista = value;

    notifyListeners();
  }
}

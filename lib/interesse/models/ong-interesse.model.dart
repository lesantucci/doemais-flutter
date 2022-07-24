import 'package:doemais/ong/models/ong.model.dart';

class OngInteresse {
  String nome = "";

  OngInteresse();

  factory OngInteresse.fromOng(Ong ong) {
    OngInteresse ongInteresse = OngInteresse();
    ongInteresse.nome = ong.nome;

    return ongInteresse;
  }
}

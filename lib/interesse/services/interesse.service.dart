import 'dart:convert';

import 'package:doemais/commons/endpoints.dart';
import 'package:doemais/commons/handler/http.dart';
import 'package:doemais/interesse/models/interesse.model.dart';
import 'package:doemais/interesse/models/ong-interesse.model.dart';
import 'package:doemais/ong/models/ong.model.dart';
import 'package:doemais/ong/services/ong.service.dart';
import 'package:http/http.dart';

class InteresseService {
  final OngService ongService = OngService();

  Future<List<Interesse>> consultarListaDeInteresses() async {
    List<Interesse> lista = [];

    Response response = await HttpHandler.get(Endpoints.interesses);

    dynamic body = json.decode(response.body)["campanhas"];

    for (dynamic json in List.from(body)) {
      Interesse interesse = Interesse.fromJson(json);

      Ong ong = await ongService.getOng(interesse.ongId);

      interesse.ong = OngInteresse.fromOng(ong);

      lista.add(interesse);
    }

    return lista;
  }
}

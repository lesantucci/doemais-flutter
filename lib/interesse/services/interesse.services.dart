import 'dart:convert';

import 'package:doemais/commons/endpoints.dart';
import 'package:doemais/commons/handler/http.dart';
import 'package:doemais/interesse/models/interesse.model.dart';
import 'package:http/http.dart';

class InteresseService {
  Future<List<Interesse>> consultarListaDeInteresses() async {
    Response response = await HttpHandler.get(Endpoints.interesses);

    if (response.statusCode == 200) {
      dynamic body = json.decode(response.body)["campanhas"];

      return List.from(body).map((e) => Interesse.fromJson(e)).toList();
    }

    return List.empty();
  }
}

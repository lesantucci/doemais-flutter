import 'dart:convert';

import 'package:doemais/campanha/models/campanha.model.dart';
import 'package:doemais/commons/endpoints.dart';
import 'package:doemais/commons/handler/http.dart';
import 'package:http/http.dart';

class CampanhaService {
  Future<List<Campanha>> listarCampanhas() async {
    Response response = await HttpHandler.get(Endpoints.campanha);
    if (response.statusCode == 200) {
      return List<Campanha>.from(json
          .decode(response.body)["campanhas"]
          .map((data) => Campanha.fromJson(data)));
    } else {
      return [];
    }
  }

  Future<bool> apoiar(String id) async {
    Response response = await HttpHandler.post(
        Endpoints.campanhaApoiar, <String, dynamic>{'id': id});
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<Campanha> pesquisarCampanha(id) async {
    String endpoing = '${Endpoints.campanha}/$id';
    Response response = await HttpHandler.get(endpoing);
    print(response.body);
    final objJson = json.decode(response.body)['campanha'];
    return Campanha.fromJson(objJson);
  }
}

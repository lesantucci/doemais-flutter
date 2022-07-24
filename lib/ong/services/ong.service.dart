import 'dart:convert';

import 'package:doemais/commons/endpoints.dart';
import 'package:doemais/commons/handler/http.dart';
import 'package:doemais/ong/models/ong.model.dart';
import 'package:http/http.dart';

class OngService {
  Future<List<Ong>> pesquisar() async {
    try {
      Response response = await HttpHandler.get(Endpoints.ong);
      final objJson = json.decode(response.body)['Ongs'];
      return List<Ong>.from(objJson.map((data) => Ong.fromJson(data)));
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> favoritar(String id) async {
    try {
      await HttpHandler.post(
          Endpoints.ongFavoritar, <String, dynamic>{'id': id});
      return true;
    } catch (e) {
      return false;
    }
  }
}

import 'dart:convert';

import 'package:doemais/commons/endpoints.dart';
import 'package:doemais/commons/handler/http.dart';
import 'package:doemais/ong/models/categorias.model.dart';
import 'package:doemais/ong/models/ong.model.dart';
import 'package:http/http.dart';

class OngService {
  Future<List<Ong>> pesquisar() async {
    Response response = await HttpHandler.get(Endpoints.ong);
    final objJson = json.decode(response.body)['Ongs'];
    return List<Ong>.from(objJson.map((data) => Ong.fromJson(data)));
  }

  Future<Ong> favoritar(String id) async {
    Response response = await HttpHandler.post(
        Endpoints.ongFavoritar, <String, dynamic>{'id': id});
    final objJson = json.decode(response.body)['ong'];
    return Ong.fromJson(objJson);
  }

  Future<List<CategoriaOng>> pesquisarCategorias() async {
    Response response = await HttpHandler.get(Endpoints.categoriaONG);
    final objJson = json.decode(response.body)['categorias'];
    print(objJson);
    return List<CategoriaOng>.from(
        objJson.map((data) => CategoriaOng.fromJson(data)));
  }
}

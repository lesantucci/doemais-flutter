import 'dart:convert';

import 'package:doemais/campanha/models/campanha.model.dart';
import 'package:doemais/commons/endpoints.dart';
import 'package:doemais/commons/handler/http.dart';
import 'package:doemais/interesse/models/interesse.model.dart';
import 'package:http/http.dart';

class InteresseService {
  Future<List<Campanha>> listarInteresses() async {
    Response response = await HttpHandler.get(Endpoints.interesses);
    
    if (response.statusCode == 200) {
      var bodyDecored = json.decode(response.body)["campanhas"];
      print(bodyDecored);
      return List<Campanha>.from(json
          .decode(response.body)["campanhas"]
          .map((data) => Campanha.fromJson(data)));
    }

    return List.empty();
  }
}

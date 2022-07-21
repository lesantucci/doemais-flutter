import 'dart:convert';

import 'package:doemais/commons/endpoints.dart';
import 'package:doemais/commons/handler/http.dart';
import 'package:doemais/commons/storage.dart';
import 'package:doemais/usuario/models/usuario.model.dart';
import 'package:http/http.dart';

class UsuarioService {
  Future<bool> login(String login, String password) async {
    Response response = await HttpHandler.post(Endpoints.usuarioLogin,
        <String, dynamic>{'email': login, 'senha': password});
    print(json.decode(response.body));
    if (response.statusCode == 200) {
      Storage.jwt = json.decode(response.body)["token"];
      return true;
    } else {
      return false;
    }
  }

  Future<bool> cadastrar(String email, String password) async {
    Response response = await HttpHandler.post(Endpoints.usuarioCadastrar,
        <String, dynamic>{'email': email, 'senha': password});
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> atualizarPerfil(Usuario usuario) async {
    Response response =
        await HttpHandler.put(Endpoints.usuarioCadastrar, <String, dynamic>{
      'nome': usuario.nome,
      'dtNascimento': usuario.dtNascimento,
      'email': usuario.email,
      'sexo': usuario.sexo,
      'contato': usuario.contato
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}

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
    dynamic body = <String, dynamic>{
      'nome': usuario.nome,
      'nascimento': usuario.dtNascimento,
      'sexo': usuario.sexo,
      'contato': usuario.contato
    };
    Response response =
        await HttpHandler.put(Endpoints.usuarioPerfil, jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<Usuario> consultarPerfil() async {
    Response response = await HttpHandler.get(Endpoints.usuarioPerfil);

    if (response.statusCode == 200) {
      dynamic body = json.decode(response.body)["usuario"];

      return Usuario.fromJson(body);
    } else {
      return Usuario();
    }
  }

  Future<bool> alterarSenha(senhaAtual, novaSenha, email) async {
    dynamic body = <String, dynamic>{
      'senhaAtual': senhaAtual,
      'novaSenha': novaSenha,
      'email': email,
    };
    print(body);
    Response response = await HttpHandler.post(Endpoints.changePassword, body);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}

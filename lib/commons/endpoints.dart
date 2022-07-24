class Endpoints {
  // BASE
  static const String baseUrl = "https://apl-back-doe-mais-ong.herokuapp.com";

  // USUARIO
  static const String usuarioLogin = "$baseUrl/usuario/login";
  static const String usuarioCadastrar = "$baseUrl/usuario/cadastrar";
  static const String usuarioPerfil = "$baseUrl/usuario/perfil";
  static const String usuarioCampanha = "$baseUrl/usuario/campanha";
  static const String usuarioOng = "$baseUrl/usuario/ong";

  //CAMPANHA
  static const String campanha = "$baseUrl/campanha";
  static const String campanhaApoiar = "$baseUrl/campanha/apoiar";

  //ONG
  static const String ong = "$baseUrl/ong";
  static const String ongCapanha = "$baseUrl/ong/campanha";
  static const String ongFavoritar = "$baseUrl/ong/favorita";

  static const String categoriaONG = "$baseUrl/categorias/ONG";

  // INTERESSES
  static const String interesses = "${Endpoints.campanha}/interesses";

  static String getArquivoAvatar(String nome) {
    return "$baseUrl/imagens/ongs/avatar/$nome";
  }
}

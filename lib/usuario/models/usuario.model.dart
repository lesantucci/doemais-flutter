class Usuario {
  String nome = "";
  String sexo = "";
  String email = "";
  String dtNascimento = "";
  String contato = "";
  String iniciais = "";

  Usuario();

  factory Usuario.fromJson(Map<String, dynamic> json) {
    Usuario usuario = Usuario();
    usuario.nome = json['nome'];
    usuario.sexo = json['sexo'];
    usuario.email = json['email'];
    usuario.dtNascimento = json['nascimento'];
    usuario.contato = json['contato'];

    return usuario;
  }
}

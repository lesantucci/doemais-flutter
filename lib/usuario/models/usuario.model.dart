class Usuario {
  final String nome;
  final String sexo;
  final String email;
  final String dtNascimento;
  final String contato;

  const Usuario(
      {required this.nome,
      required this.sexo,
      required this.email,
      required this.dtNascimento,
      required this.contato});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        nome: json['nome'],
        sexo: json['sexo'],
        email: json['email'],
        dtNascimento: json['nascimento'],
        contato: json['contato']);
  }
}

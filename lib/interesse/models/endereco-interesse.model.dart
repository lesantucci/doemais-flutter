class EnderecoInteresse {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;

  const EnderecoInteresse(
      {required this.cep,
      required this.logradouro,
      required this.complemento,
      required this.bairro,
      required this.localidade,
      required this.uf});

  factory EnderecoInteresse.fromJson(Map<String, dynamic> json) {
    return EnderecoInteresse(
        cep: json['_cep'],
        logradouro: json['logradouro'],
        complemento: json['complemento'],
        bairro: json['bairro'],
        localidade: json['localidade'],
        uf: json['uf']);
  }
}

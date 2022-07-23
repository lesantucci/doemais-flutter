class Endereco {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String latitude;
  final String longitude;

  const Endereco(
      {required this.cep,
      required this.logradouro,
      required this.complemento,
      required this.bairro,
      required this.localidade,
      required this.uf,
      required this.latitude,
      required this.longitude});

  factory Endereco.fromJson(Map<String, dynamic> json) {
    return Endereco(
        cep: json['cep'],
        logradouro: json['logradouro'],
        complemento: json['complemento'],
        bairro: json['bairro'],
        localidade: json['localidade'],
        uf: json['uf'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }
}
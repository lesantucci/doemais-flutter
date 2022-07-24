import 'package:doemais/interesse/models/endereco-interesse.model.dart';

class Interesse {
  final String id;
  final String nome;
  final String descricao;
  final String ongId;
  final Map<String, dynamic> imagens;
  final String dataInicial;
  final String dataFinal;
  final bool apoio;
  final EnderecoInteresse endereco;

  const Interesse(
      {required this.id,
      required this.nome,
      required this.descricao,
      required this.ongId,
      required this.imagens,
      required this.dataInicial,
      required this.dataFinal,
      required this.apoio,
      required this.endereco});

  factory Interesse.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> enderecoJson = json['endereco'];

    EnderecoInteresse endereco = EnderecoInteresse(
        cep: enderecoJson['cep'],
        logradouro: enderecoJson['logradouro'],
        complemento: enderecoJson['complemento'],
        bairro: enderecoJson['bairro'],
        localidade: enderecoJson['localidade'],
        uf: enderecoJson['uf']);

    return Interesse(
        id: json['_id'],
        nome: json['nome'],
        descricao: json['descricao'],
        ongId: json['ong'],
        imagens: json['imagens'],
        dataInicial: json['dataInicial'],
        dataFinal: json['dataFinal'],
        apoio: json['apoio'],
        endereco: endereco);
  }
}

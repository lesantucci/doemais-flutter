import 'package:doemais/interesse/models/endereco-interesse.model.dart';
import 'package:doemais/interesse/models/ong-interesse.model.dart';

class Interesse {
  late String id;
  late String nome;
  late String descricao;
  late String ongId;
  late Map<String, dynamic> imagens;
  late String dataInicial;
  late String dataFinal;
  late bool apoio;
  late EnderecoInteresse endereco;
  late OngInteresse ong = OngInteresse();

  Interesse();

  factory Interesse.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> enderecoJson = json['endereco'];

    EnderecoInteresse endereco = EnderecoInteresse(
        cep: enderecoJson['cep'],
        logradouro: enderecoJson['logradouro'],
        complemento: enderecoJson['complemento'],
        bairro: enderecoJson['bairro'],
        localidade: enderecoJson['localidade'],
        uf: enderecoJson['uf']);

    Interesse interesse = Interesse();

    interesse.id = json['_id'];
    interesse.nome = json['nome'];
    interesse.descricao = json['descricao'];
    interesse.ongId = json['ong'];
    interesse.imagens = json['imagens'];
    interesse.dataInicial = json['dataInicial'];
    interesse.dataFinal = json['dataFinal'];
    interesse.apoio = json['apoio'];
    interesse.endereco = endereco;

    return interesse;
  }
}

import 'package:doemais/campanha/models/campanha.model.dart';
import 'package:doemais/campanha/services/campanha.service.dart';

import 'package:doemais/theme/app-color.dart';
import 'package:flutter/material.dart';

class DetalhesScreen extends StatefulWidget {
  String id;

  DetalhesScreen({super.key, required this.id});

  @override
  State<DetalhesScreen> createState() => _DetalhesScreenState();
}

class _DetalhesScreenState extends State<DetalhesScreen> {
  late Campanha campanha = Campanha();
  late List<dynamic> imagens = [];

  void carregarCampanha() {
    var campanhaService = CampanhaService();
    campanhaService.pesquisarCampanha(widget.id).then((response) => {
          setState(() {
            campanha = response;
            imagens = campanha.imagens['galeria'];
          })
        });
  }

  @override
  void initState() {
    super.initState();
    carregarCampanha();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detalhes da Campanha")),
      body: SizedBox(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    campanha.nome,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20, color: AppColor.primary),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Text(
                      campanha.descricao,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imagens.length,
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.network(
                      montarUrlFotos(index),
                      width: 155.5,
                      height: 150,
                    )),
              ),
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    'Localização',
                    style: TextStyle(fontSize: 20, color: Color(0xff6200ee)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Text(
                    '${campanha.endereco.bairro}, ${campanha.endereco.logradouro} - ${campanha.endereco.localidade}, ${campanha.endereco.uf}',
                    style: const TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Icon(
                    Icons.supervisor_account,
                    color: AppColor.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 20, 10, 20),
                  child: Text(
                    '${campanha.apoiadores} Apoiadores',
                    style: const TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                height: 50,
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Sobre a ONG'),
                                ),
                              ))),
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                height: 50,
                                width: 150,
                                child: ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    size: 24.0,
                                  ),
                                  onPressed: () {},
                                  label: const Text('Apoiar'),
                                ),
                              ))),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  String montarUrlFotos(int index) {
    String path =
        'https://apl-back-doe-mais-ong.herokuapp.com/imagens/campanhas/galeria/';
    String imagem = imagens[index];
    if (imagem != '') {
      return path + imagem;
    }
    return '${path}a';
  }
}

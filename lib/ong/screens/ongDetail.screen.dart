import 'package:doemais/campanha/models/campanha.model.dart';
import 'package:doemais/ong/models/ong.model.dart';
import 'package:doemais/ong/services/ong.service.dart';
import 'package:flutter/material.dart';

import '../../campanha/widgets/card_campanha.dart';
import '../widgets/agendaWidget.dart';

class OngDetailScreen extends StatefulWidget {
  String id;
  OngDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<OngDetailScreen> createState() => _OngDetailScreenState();
}

class _OngDetailScreenState extends State<OngDetailScreen> {
  List<Campanha> listaCampanha = [];
  OngService ongService = OngService();
  late Ong ong = Ong();
  late List<dynamic> imagens = [];

  void listarCampanhas() {
    var ongService = OngService();
    ongService.pesquiarCampanhasOng(widget.id).then((listaResponse) => {
          setState(() {
            listaCampanha = listaResponse;
          })
        });
  }

  void carregarOng() {
    var ongService = OngService();
    ongService.pesquisarOng(widget.id).then((response) => {
          setState(() {
            ong = response;
            imagens = ong.imagens['galeria'];
          })
        });
  }

  @override
  void initState() {
    super.initState();
    carregarOng();
    listarCampanhas();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Detalhes da ONG"),
              bottom: const TabBar(
                tabs: [
                  Tab(text: "Sobre"),
                  Tab(text: "Campanhas"),
                ],
                labelColor: Colors.purple,
                labelStyle: TextStyle(),
                indicatorColor: Colors.purple,
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ong.nome,
                          style: const TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: Expanded(
                            child: Text(
                              ong.descricao,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 150,
                            child: Expanded(
                                child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: imagens.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: EdgeInsets.all(10),
                                    child: SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Image.network(
                                            montarUrlFotos(index))));
                              },
                            ))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Localização',
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      montarEndereco(),
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )))
                          ],
                        ),
                        AgendaWidget()
                      ],
                    )),
                Expanded(
                    child: listaCampanha.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listaCampanha.length,
                            itemBuilder: (context, index) =>
                                CardCampanha(campanha: listaCampanha[index]))
                        : const Text("Sem dados para serem exibidos"))
              ],
            )));
  }

  String montarUrlFotos(int index) {
    String path =
        'https://apl-back-doe-mais-ong.herokuapp.com/imagens/ongs/galeria/';
    String imagem = imagens[index];
    if (imagem != '') {
      return path + imagem;
    }
    return '${path}a';
  }

  String montarEndereco() {
    if (ong.endereco.isNotEmpty) {
      String logradouro = ong.endereco['logradouro'];
      String bairro = ong.endereco['bairro'];
      String localidade = ong.endereco['localidade'];
      String uf = ong.endereco['uf'];

      return '$logradouro - $bairro, $localidade - $uf';
    }
    return '';
  }
}

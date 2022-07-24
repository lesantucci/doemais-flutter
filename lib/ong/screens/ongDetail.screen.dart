import 'package:doemais/ong/models/ong.model.dart';
import 'package:flutter/material.dart';

class OngDetailScreen extends StatefulWidget {
  Ong ong;
  List<dynamic> imagens;
  OngDetailScreen({Key? key, required this.ong, required this.imagens})
      : super(key: key);

  @override
  State<OngDetailScreen> createState() => _OngDetailScreenState();
}

class _OngDetailScreenState extends State<OngDetailScreen> {
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
                          super.widget.ong.nome,
                          style: const TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Expanded(
                            child: Text(
                              super.widget.ong.descricao,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Expanded(
                            child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: super.widget.imagens.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: EdgeInsets.all(10),
                                child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(
                                        "https://apl-back-doe-mais-ong.herokuapp.com/imagens/ongs/avatar/${super.widget.imagens[index]}")));
                          },
                        )),
                        SizedBox(
                          child: Text("aaaaaaaaaaa"),
                        )
                      ],
                    )),
                Text("Segunda guia selecionada")
              ],
            )));
  }
}

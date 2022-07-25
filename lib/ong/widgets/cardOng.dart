import 'package:doemais/ong/screens/ongDetail.screen.dart';

import '../controller/Filter.controller.dart';
import '../models/ong.model.dart';
import 'package:flutter/material.dart';

import '../services/ong.service.dart';

class CardOng extends StatefulWidget {
  final Ong ong;
  FilterController filterController;

  CardOng({Key? key, required this.ong, required this.filterController})
      : super(key: key);

  @override
  State<CardOng> createState() => _CardOngState();
}

class _CardOngState extends State<CardOng> {
  final OngService ongService = OngService();
  _CardOngState({Key? key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => showDialog(
            context: context,
            builder: (context) => OngDetailScreen(
                  id: super.widget.ong.id,
                )),
        child: Card(
            child: SizedBox(
                height: 140,
                child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    getImagemUrl(super.widget.ong)),
                                radius: 220,
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.1,
                                            color: Color(0xff6200ee)),
                                        super.widget.ong.nome,
                                      ),
                                    )),
                                    super.widget.ong.favorito
                                        ? IconButton(
                                            icon: const Icon(Icons.star),
                                            color: Colors.purple,
                                            visualDensity:
                                                VisualDensity.standard,
                                            iconSize: 30,
                                            alignment: const Alignment(0, -5),
                                            onPressed: () async {
                                              setState(() {
                                                try {
                                                  ongService.favoritar(
                                                      super.widget.ong.id);
                                                  super
                                                      .widget
                                                      .filterController
                                                      .atualizarFav(
                                                          super.widget.ong);
                                                } catch (e) {
                                                  rethrow;
                                                }
                                              });
                                            },
                                          )
                                        : IconButton(
                                            icon: const Icon(Icons.star_border),
                                            color: Colors.purple,
                                            visualDensity:
                                                VisualDensity.standard,
                                            iconSize: 30,
                                            alignment: const Alignment(0, -5),
                                            onPressed: () async {
                                              setState(() {
                                                try {
                                                  ongService.favoritar(
                                                      super.widget.ong.id);
                                                  super
                                                      .widget
                                                      .filterController
                                                      .atualizarFav(
                                                          super.widget.ong);
                                                } catch (e) {
                                                  rethrow;
                                                }
                                              });
                                            },
                                          ),
                                  ],
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    super.widget.ong.descricao,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, top: 5, right: 37),
                                      child: Text(
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            letterSpacing: 1.1,
                                            color: Color(0xff6200ee)),
                                        "Capanhas Ativas: ",
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            letterSpacing: 1.1,
                                            color: Color(0xff6200ee)),
                                        super
                                            .widget
                                            .ong
                                            .campanhasAtivas
                                            .toString(),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 5, top: 5, right: 10, bottom: 10),
                                    child: Text(
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          letterSpacing: 1.1,
                                          color: Color(0xff6200ee)),
                                      "Capanhas Encerradas:",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 10),
                                    child: Text(
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          letterSpacing: 1.1,
                                          color: Color(0xff6200ee)),
                                      super
                                          .widget
                                          .ong
                                          .campanhasEncerradas
                                          .toString(),
                                    ),
                                  ),
                                ]),
                              ],
                            )),
                      ],
                    )))));
  }

  String getImagemUrl(Ong ong) {
    String path =
        'https://apl-back-doe-mais-ong.herokuapp.com/imagens/ongs/avatar/';
    var imagem = ong.imagens['avatar'];
    if (imagem != '') {
      return path + imagem;
    } else {
      return '${path}a';
    }
  }
}

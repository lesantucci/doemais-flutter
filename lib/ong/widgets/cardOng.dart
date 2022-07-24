import '../models/ong.model.dart';
import 'package:flutter/material.dart';

import '../services/ong.service.dart';

class CardOng extends StatefulWidget {
  final Ong ong;

  const CardOng({Key? key, required this.ong}) : super(key: key);

  @override
  State<CardOng> createState() => _CardOngState(
      favorito: ong.favorito, imagem: ong.imagens['avatar'].toString());
}

class _CardOngState extends State<CardOng> {
  bool favorito;
  String imagem;
  final OngService ongService = OngService();
  _CardOngState({Key? key, required this.favorito, required this.imagem});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                                'https://apl-back-doe-mais-ong.herokuapp.com/imagens/ongs/avatar/$imagem'),
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
                                favorito
                                    ? IconButton(
                                        icon: const Icon(Icons.star),
                                        color: Colors.purple,
                                        visualDensity: VisualDensity.standard,
                                        iconSize: 30,
                                        alignment: const Alignment(0, -5),
                                        onPressed: () async {
                                          setState(() {
                                            try {
                                              ongService.favoritar(
                                                  super.widget.ong.id);
                                              favorito = false;
                                            } catch (e) {
                                              rethrow;
                                            }
                                          });
                                        },
                                      )
                                    : IconButton(
                                        icon: const Icon(Icons.star_border),
                                        color: Colors.purple,
                                        visualDensity: VisualDensity.standard,
                                        iconSize: 30,
                                        alignment: const Alignment(0, -5),
                                        onPressed: () async {
                                          setState(() {
                                            try {
                                              ongService.favoritar(
                                                  super.widget.ong.id);
                                              favorito = true;
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
                              padding: const EdgeInsets.only(top: 2, left: 5),
                              child: Text(
                                super.widget.ong.descricao,
                                style: const TextStyle(
                                    fontSize: 8,
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
                                    super.widget.ong.campanhasAtivas.toString(),
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
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 10),
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
                ))));
  }
}
import 'package:doemais/campanha/models/campanha.model.dart';
import 'package:flutter/material.dart';

class CardCampanha extends StatelessWidget {
  final Campanha campanha;

  const CardCampanha({Key? key, required this.campanha}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
            height: 140,
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("https://apl-back-doe-mais-ong.herokuapp.com/imagens/campanhas/avatar/${campanha.imagens['avatar']}"),
                            radius: 220,
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(padding: const EdgeInsets.only(left: 5),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.1,
                                    color: Color(0xff6200ee)),
                                campanha.nome,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(campanha.ong["_id"],
                                  style: const TextStyle(fontSize: 12)),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: RichText(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    textAlign: TextAlign.start,
                                    textScaleFactor: 1.0,
                                    text: TextSpan(
                                      text: campanha.descricao,
                                      style: const TextStyle(
                                        fontSize: 12
                                      )))),
                            const Spacer(),
                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: 
                                    Text(
                                      campanha.endereco.toString(),
                                      style: const TextStyle(
                                        fontSize: 10
                                      ),)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                Expanded(
                                    flex: 0,
                                    child: SizedBox(
                                      height: 32,
                                      child: ElevatedButton.icon(
                                        icon: const Icon(
                                          Icons.favorite,
                                          size: 18.0,
                                        ),
                                        onPressed: () => {},
                                        label: const Text('Apoiar'),
                                      ),
                                    ))
                              ],
                            )
                          ],
                        )))
                  ],
                ))));
  }
}

import 'package:doemais/ong/models/ong.model.dart';
import 'package:doemais/ong/widgets/CardOng.dart';
import 'package:flutter/material.dart';

class OngScreen extends StatefulWidget {
  const OngScreen({Key? key}) : super(key: key);

  @override
  State<OngScreen> createState() => _OngScreenState();
}

class _OngScreenState extends State<OngScreen> {
  List<Ong> lista = allOngs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "ONGs",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  onChanged: searchOng,
                  decoration: const InputDecoration(
                    labelText: 'Pesquisar',
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: lista.length,
                      itemBuilder: (context, index) =>
                          CardOng(ong: lista[index])))
            ])));
  }

  void searchOng(String query) {
    final suggestions = allOngs.where((ong) {
      final titulo = ong.titulo.toLowerCase();
      final input = query.toLowerCase();

      return titulo.contains(input);
    }).toList();

    setState(() {
      lista = suggestions;
    });
  }
}

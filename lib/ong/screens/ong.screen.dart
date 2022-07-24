import 'package:doemais/ong/models/ong.model.dart';
import 'package:doemais/ong/screens/ongFilters.screen.dart';
import 'package:doemais/ong/services/ong.service.dart';
import 'package:doemais/ong/widgets/cardOng.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OngScreen extends StatefulWidget {
  const OngScreen({Key? key}) : super(key: key);

  @override
  State<OngScreen> createState() => _OngScreenState();
}

class _OngScreenState extends State<OngScreen> {
  late List<Ong> lista;
  List<Ong> listaFiltrada = [];
  final OngService ongService = OngService();

  void _listarOngs() {
    ongService.pesquisar().then((list) => {
          setState(() {
            lista = list;
            listaFiltrada = list;
          })
        });
  }

  @override
  initState() {
    super.initState();
    _listarOngs();
  }

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
                  decoration: InputDecoration(
                      labelText: 'Pesquisar',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.filter_list),
                        onPressed: () {
                          showCupertinoModalPopup(
                              context: context,
                              builder: (context) => ongFiltersScreen());
                        },
                      )),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listaFiltrada.length,
                      itemBuilder: (context, index) =>
                          CardOng(ong: listaFiltrada[index])))
            ])));
  }

  void searchOng(String query) {
    final suggestions = lista.where((ong) {
      final titulo = ong.nome.toLowerCase();
      final input = query.toLowerCase();

      return titulo.contains(input);
    }).toList();

    setState(() {
      listaFiltrada = suggestions;
    });
  }
}

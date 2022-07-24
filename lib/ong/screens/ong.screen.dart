import 'package:doemais/ong/controller/Filter.controller.dart';
import 'package:doemais/ong/models/ong.model.dart';
import 'package:doemais/ong/widgets/ongFilters.screen.dart';
import 'package:doemais/ong/services/ong.service.dart';
import 'package:doemais/ong/widgets/cardOng.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OngScreen extends StatefulWidget {
  const OngScreen({Key? key}) : super(key: key);

  @override
  State<OngScreen> createState() => _OngScreenState();
}

class _OngScreenState extends State<OngScreen> {
  late List<Ong> lista;

  final OngService ongService = OngService();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FilterController>(
        create: (context) => FilterController(),
        child: Builder(builder: (context) {
          final local = context.watch<FilterController>();
          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "ONGs",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  local.onlyFav
                      ? IconButton(
                          onPressed: () => local.searchOngByFav(),
                          iconSize: 35,
                          color: Colors.purple,
                          icon: const Icon(Icons.stars))
                      : IconButton(
                          onPressed: () => local.searchOngByFav(),
                          iconSize: 35,
                          color: Colors.black,
                          icon: const Icon(Icons.stars))
                ],
              ),
              body: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                        onChanged: (value) => local.searchOng(value),
                        decoration: InputDecoration(
                            labelText: 'Pesquisar',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.filter_list),
                              onPressed: () {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) => ongFiltersScreen(
                                          filterController: local,
                                        ));
                              },
                            )),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: local.listaFiltrada.length,
                            itemBuilder: (context, index) =>
                                CardOng(ong: local.listaFiltrada[index])))
                  ])));
        }));
  }
}

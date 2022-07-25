import 'package:doemais/ong/models/categorias.model.dart';
import 'package:doemais/ong/services/ong.service.dart';
import 'package:flutter/material.dart';

import '../controller/Filter.controller.dart';

class ongFiltersScreen extends StatefulWidget {
  FilterController filterController;
  ongFiltersScreen({Key? key, required this.filterController})
      : super(key: key);

  @override
  State<ongFiltersScreen> createState() => _ongFiltersScreenState();
}

class _ongFiltersScreenState extends State<ongFiltersScreen> {
  OngService ongService = OngService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Filtro de Pesquisa")),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(bottom: 5, left: 10),
                          child: Text("Categorias",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ))),
                      Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: super
                                  .widget
                                  .filterController
                                  .categorias
                                  .length,
                              itemBuilder: (context, index) => Row(
                                    children: [
                                      Checkbox(
                                        value: super
                                            .widget
                                            .filterController
                                            .categorias[index]
                                            .checked,
                                        onChanged: (value) {
                                          setState(() {
                                            super
                                                .widget
                                                .filterController
                                                .categorias[index]
                                                .checked = value!;
                                            super
                                                .widget
                                                .filterController
                                                .searchOngByCategory(super
                                                    .widget
                                                    .filterController
                                                    .categorias[index]);
                                          });
                                        },
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(7),
                                          child: Text(
                                              super
                                                  .widget
                                                  .filterController
                                                  .categorias[index]
                                                  .titulo,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              )))
                                    ],
                                  )))
                    ]))));
  }
}

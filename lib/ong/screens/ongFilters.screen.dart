import 'package:doemais/ong/models/categorias.model.dart';
import 'package:flutter/material.dart';

import '../models/ong.model.dart';

class ongFiltersScreen extends StatefulWidget {
  ongFiltersScreen({Key? key}) : super(key: key);

  @override
  State<ongFiltersScreen> createState() => _ongFiltersScreenState();
}

class _ongFiltersScreenState extends State<ongFiltersScreen> {
  List<CategoriaOng> categorias = Allcategorias;
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
                              itemCount: categorias.length,
                              itemBuilder: (context, index) => Row(
                                    children: [
                                      Checkbox(
                                        value: categorias[index].checked,
                                        onChanged: (value) {
                                          setState(() {
                                            categorias[index].checked = value!;
                                          });
                                        },
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(7),
                                          child: Text(categorias[index].titulo,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              )))
                                    ],
                                  )))
                    ]))));
  }
}

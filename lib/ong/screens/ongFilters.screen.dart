import 'package:flutter/material.dart';

class ongFiltersScreen extends StatefulWidget {
  ongFiltersScreen({Key? key}) : super(key: key);

  @override
  State<ongFiltersScreen> createState() => _ongFiltersScreenState();
}

class _ongFiltersScreenState extends State<ongFiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Filtro de Pesquisa")),
        body: SizedBox(
          width: double.infinity,
          child: Column(children: []),
        ));
  }
}

import 'package:doemais/campanha/models/campanha.model.dart';
import 'package:doemais/campanha/widgets/card_campanha.dart';
import 'package:doemais/interesse/services/interesse.services.dart';
import 'package:flutter/material.dart';

class InteresseScreen extends StatefulWidget {
  const InteresseScreen({Key? key}) : super(key: key);

  @override
  State<InteresseScreen> createState() => _InteresseScreenState();
}

class _InteresseScreenState extends State<InteresseScreen> {
  List<Campanha> lista = [];

  void listarCampanhas() {
    print("ENTROU NA INTERESSE");
    var serviceCampanha = InteresseService();
    serviceCampanha.listarInteresses().then((listaResponse) => {
          setState(() {
            lista = listaResponse;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    listarCampanhas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Interesses"),
        ),
        body: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(children: [
              Expanded(
                  child: lista.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: lista.length,
                          itemBuilder: (context, index) =>
                              CardCampanha(campanha: lista[index]))
                      : const Text("Sem dados para serem exibidos"))
            ])));
  }
}

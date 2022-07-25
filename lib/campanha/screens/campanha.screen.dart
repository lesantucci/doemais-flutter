import 'package:doemais/campanha/models/campanha.model.dart';
import 'package:doemais/campanha/services/campanha.service.dart';
import 'package:doemais/campanha/widgets/card_campanha.dart';
import 'package:flutter/material.dart';

class CampanhaScreen extends StatefulWidget {
  const CampanhaScreen({Key? key}) : super(key: key);

  @override
  State<CampanhaScreen> createState() => _CampanhaScreenState();
}

class _CampanhaScreenState extends State<CampanhaScreen> {
  List<Campanha> lista = [];
  List<Campanha> listaFiltrada = [];

  void listarCampanhas() {
    print("ENTROU NA CAMPANHA");
    var serviceCampanha = CampanhaService();
    serviceCampanha.listarCampanhas().then((listaResponse) => {
          setState(() {
            lista = listaResponse;
            listaFiltrada = listaResponse;
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
          title: const Text("Campanhas"),
        ),
        body: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  onChanged: searchCampanha,
                  decoration: const InputDecoration(
                    labelText: 'Pesquisar',
                  ),
                ),
              ),
              Expanded(
                  child: lista.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listaFiltrada.length,
                          itemBuilder: (context, index) =>
                              CardCampanha(campanha: listaFiltrada[index]))
                      : const Text("Sem dados para serem exibidos"))
            ])));
  }

  void searchCampanha(String query) {
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

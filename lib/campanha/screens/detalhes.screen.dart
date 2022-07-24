import 'package:doemais/campanha/models/campanha.model.dart';
import 'package:doemais/commons/models/agenda.model.dart';
import 'package:doemais/commons/models/endereco.model.dart';
import 'package:doemais/theme/app-color.dart';
import 'package:flutter/material.dart';

class DetalhesScreen extends StatelessWidget {
  Campanha campanha = Campanha(
      agenda: const Agenda(
          agenda: [0, 0, 0, 0, 0, 0, 0], horaInicio: "", horaFim: ""),
      apoiadores: 1,
      apoio: true,
      categoria: "",
      dataFinal: "",
      dataInicial: "",
      descricao:
          "Abertura de nova campanha para doações para instituições e abrigos de animais que necessitam de seu apoio, atualmente são 1200 cachorros e 200 gatos em aguardando um lar que precisam de seu apoio para continuarem mantendo suas energias ao aguardo de seu futuro dono."
          "Ajude-nos com um saco de 1 a 10 kg, de preferência rações sem muitos aditivos. ",
      id: 1,
      endereco: const Endereco(
          cep: "",
          logradouro: "Av. Comendador Pereira Inácio",
          complemento: "",
          bairro: "Jardim Vergueiro",
          localidade: "Sorocaba",
          uf: "SP",
          latitude: "",
          longitude: ""),
      imagens: <String, dynamic>{
        "avatar": "lib/assets/images/cat-example.png",
        "galeria": [
          "lib/assets/images/cat-example.png",
          "lib/assets/images/cat-example.png",
          "lib/assets/images/cat-example.png"
        ]
      },
      nome: "Doação de Rações",
      ong: <String, dynamic>{"id": 1, "nome": "Instituicao 1"},
      status: 1);

  DetalhesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detalhes da Campanha")),
      body: Container(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      campanha.nome,
                      style: TextStyle(fontSize: 20, color: AppColor.primary),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Text(
                        campanha.descricao,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: campanha.imagens["galeria"].length,
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.network(
                      campanha.imagens["galeria"][index],
                      width: 155.5,
                      height: 150,
                    )),
              ),
            ),
            Container(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      'Localização',
                      style: TextStyle(fontSize: 20, color: Color(0xff6200ee)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Text(
                      '${campanha.endereco.bairro}, ${campanha.endereco.logradouro} - ${campanha.endereco.localidade}, ${campanha.endereco.uf}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Icon(
                      Icons.supervisor_account,
                      color: AppColor.primary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 20, 10, 20),
                    child: Text(
                      '${campanha.apoiadores} Apoiadores',
                      style: const TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.all(20),
                      child: SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Sobre a ONG'),
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.all(20),
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.favorite_border,
                            size: 24.0,
                          ),
                          onPressed: () {},
                          label: const Text('Apoiar'),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

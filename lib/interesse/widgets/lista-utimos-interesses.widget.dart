import 'package:doemais/campanha/models/campanha.model.dart';
import 'package:doemais/interesse/models/interesse.model.dart';
import 'package:doemais/interesse/services/interesse.services.dart';
import 'package:doemais/interesse/widgets/card-interesse.widget.dart';
import 'package:flutter/material.dart';

class ListaUltimosInteresses extends StatefulWidget {
  const ListaUltimosInteresses({super.key});

  @override
  State<ListaUltimosInteresses> createState() => _ListaUltimosInteressesState();
}

class _ListaUltimosInteressesState extends State<ListaUltimosInteresses> {
  final InteresseService service = InteresseService();
  List<Campanha> campanhas = [];
  void listarUltimosInteresses() {
    service
        .listarInteresses()
        .then((response) => {setState(() => campanhas = response)});
  }

  @override
  void initState() {
    super.initState();
    listarUltimosInteresses();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Expanded(
        child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: campanhas.length,
        itemBuilder: ((context, index) =>
            CardInteresse(interesse: campanhas[index])),
      ),
      )
      ,
    );
  }
}

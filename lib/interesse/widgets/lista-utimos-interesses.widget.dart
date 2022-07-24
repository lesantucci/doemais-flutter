import 'package:doemais/interesse/models/interesse.model.dart';
import 'package:doemais/interesse/widgets/card-interesse.widget.dart';
import 'package:flutter/material.dart';

class ListaUltimosInteresses extends StatefulWidget {
  final List<Interesse> lista;

  const ListaUltimosInteresses({super.key, required this.lista});

  @override
  State<ListaUltimosInteresses> createState() => _ListaUltimosInteressesState();
}

class _ListaUltimosInteressesState extends State<ListaUltimosInteresses> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.lista.length,
        itemBuilder: ((context, index) =>
            CardInteresse(interesse: widget.lista[index])),
      ),
    );
  }
}

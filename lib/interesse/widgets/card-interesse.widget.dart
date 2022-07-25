import 'package:doemais/campanha/models/campanha.model.dart';
import 'package:doemais/commons/endpoints.dart';
import 'package:doemais/commons/widgets/custom-circle-avatar.widget.dart';
import 'package:doemais/interesse/models/interesse.model.dart';
import 'package:doemais/theme/app-color.dart';
import 'package:flutter/material.dart';

class CardInteresse extends StatefulWidget {
  final Campanha interesse;

  const CardInteresse({super.key, required this.interesse});

  @override
  State<CardInteresse> createState() => _CardInteresseState();
}

class _CardInteresseState extends State<CardInteresse> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://apl-back-doe-mais-ong.herokuapp.com/imagens/campanhas/avatar/${widget.interesse.imagens['avatar']}"),
                radius: 220,
              )),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              widget.interesse.nome,
              style: TextStyle(
                  color: AppColor.primary, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
                '${widget.interesse.dataInicial} - ${widget.interesse.dataFinal}'),
          ),
        ],
      ),
    ));
  }
}

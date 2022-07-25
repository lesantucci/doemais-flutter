import 'package:doemais/campanha/models/campanha.model.dart';
import 'package:doemais/campanha/services/campanha.service.dart';
import 'package:flutter/material.dart';

class CardCampanha extends StatefulWidget {
  final Campanha campanha;

  const CardCampanha({Key? key, required this.campanha}) : super(key: key);

  @override
  State<CardCampanha> createState() => _CardCampanhaState();
}

class _CardCampanhaState extends State<CardCampanha> {
  final CampanhaService service = CampanhaService();
  _CardCampanhaState({Key? key});

  bool _disable = false;

  void apoiarClicked() {
    _disable = true;
    service.apoiar(widget.campanha.id).then((res) => {
          setState(() {
            if (res) {
              widget.campanha.apoio = widget.campanha.apoio ? false : true;
            }
            _disable = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {print("Clicou em ${widget.campanha.nome}")},
      child: Card(
          child: SizedBox(
              height: 140,
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(5),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://apl-back-doe-mais-ong.herokuapp.com/imagens/campanhas/avatar/${widget.campanha.imagens['avatar']}"),
                              radius: 220,
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Text(
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.1,
                                          color: Color(0xff6200ee)),
                                      widget.campanha.nome,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Text(widget.campanha.ongNome,
                                        style: const TextStyle(fontSize: 12)),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: RichText(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          textAlign: TextAlign.start,
                                          textScaleFactor: 1.0,
                                          text: TextSpan(
                                              text: widget.campanha.descricao,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey)))),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: Text(
                                            widget.campanha.endereco.localidade,
                                            style:
                                                const TextStyle(fontSize: 10),
                                          )),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                          flex: -1,
                                          child: SizedBox(
                                            height: 32,
                                            child: ElevatedButton.icon(
                                              icon: Icon(
                                                !widget.campanha.apoio
                                                    ? Icons.favorite
                                                    : Icons.heart_broken,
                                                size: 18.0,
                                              ),
                                              onPressed: _disable
                                                  ? null
                                                  : () => {apoiarClicked()},
                                              label: Text(!widget.campanha.apoio
                                                  ? "Apoiar"
                                                  : 'Desapoiar'),
                                            ),
                                          ))
                                    ],
                                  )
                                ],
                              )))
                    ],
                  )))),
    );
  }
}

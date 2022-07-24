import 'package:doemais/commons/widgets/custom-circle-avatar.widget.dart';
import 'package:doemais/interesse/models/endereco-interesse.model.dart';
import 'package:doemais/interesse/models/interesse.model.dart';
import 'package:doemais/theme/app-color.dart';
import 'package:flutter/material.dart';

class CardInteresseDetalhado extends StatefulWidget {
  final Interesse interesse;

  const CardInteresseDetalhado({super.key, required this.interesse});

  @override
  State<CardInteresseDetalhado> createState() => _CardInteresseDetalhadoState();
}

class _CardInteresseDetalhadoState extends State<CardInteresseDetalhado> {
  String getEndereco(EnderecoInteresse endereco) {
    return '${widget.interesse.endereco.logradouro}, ${widget.interesse.endereco.complemento} - ${widget.interesse.endereco.bairro}, ${widget.interesse.endereco.localidade} - ${widget.interesse.endereco.uf}, ${widget.interesse.endereco.cep}';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCircleAvatarWidget(icon: widget.interesse.imagens['avatar']),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        widget.interesse.nome,
                        style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        widget.interesse.ongId,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 5),
                      child: Text(widget.interesse.descricao),
                    ),
                    Text(
                      getEndereco(widget.interesse.endereco),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

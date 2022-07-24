import 'package:doemais/commons/widgets/title.dart';
import 'package:doemais/interesse/controller/interesse.controller.dart';
import 'package:doemais/interesse/widgets/lista-utimos-interesses.widget.dart';
import 'package:flutter/material.dart';

class UltimosInteresses extends StatefulWidget {
  const UltimosInteresses({super.key});

  @override
  State<UltimosInteresses> createState() => _UltimosInteressesState();
}

class _UltimosInteressesState extends State<UltimosInteresses> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: InteresseController.instance,
      builder: (context, child) {
        return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Row(
                  children: const [
                    CustomTitle(
                      texto: "Últimos interesses",
                    ),
                  ],
                ),
                Row(
                  children: [
                    ListaUltimosInteresses(
                        lista: InteresseController.instance.lista),
                  ],
                ),
              ],
            ));
      },
    );
  }
}

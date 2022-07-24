import 'package:doemais/commons/widgets/title.dart';
import 'package:doemais/interesse/controller/interesse.controller.dart';
import 'package:doemais/interesse/widgets/card-interesse-detalhado.widget.dart';
import 'package:flutter/material.dart';

class InteresseScreen extends StatefulWidget {
  const InteresseScreen({super.key});

  @override
  State<InteresseScreen> createState() => _InteresseScreenState();
}

class _InteresseScreenState extends State<InteresseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interesses"),
      ),
      body: AnimatedBuilder(
        animation: InteresseController.instance,
        builder: (context, child) {
          return Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: InteresseController.instance.lista.length,
                    itemBuilder: (context, index) {
                      return CardInteresseDetalhado(
                          interesse: InteresseController.instance.lista[index]);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

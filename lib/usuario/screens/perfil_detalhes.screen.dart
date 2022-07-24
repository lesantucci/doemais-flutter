import 'package:doemais/commons/widgets/title.dart';
import 'package:doemais/interesse/widgets/ultimos-interesses.widget.dart';
import 'package:doemais/usuario/controller/perfil_controller.dart';
import 'package:doemais/usuario/models/usuario.model.dart';
import 'package:flutter/material.dart';

final List<String> listaSexo = ['Feminino', 'Masculino'];

class PerfilDetalhesScreen extends StatefulWidget {
  final Usuario usuario;

  const PerfilDetalhesScreen(this.usuario, {super.key});

  @override
  State<PerfilDetalhesScreen> createState() => _PerfilDetalhesScreenState();
}

class _PerfilDetalhesScreenState extends State<PerfilDetalhesScreen> {
  void retornar() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Center(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 0.95,
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: const [
                    SizedBox(
                      height: 50,
                      child: CustomTitle(texto: 'Perfil'),
                    ),
                  ],
                ),
              ),
            ),
            FractionallySizedBox(
                widthFactor: 0.95,
                child: Card(
                  child: Container(
                    width: double.infinity,
                    decoration: ShapeDecoration.fromBoxDecoration(BoxDecoration(
                        border: Border.all(color: Colors.lightBlueAccent))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: ShapeDecoration(
                              shape: const CircleBorder(),
                              color: Colors.deepPurple[100],
                            ),
                            child: Center(
                              child: Text(
                                widget.usuario.iniciais,
                                style: const TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 42,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, bottom: 5),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      widget.usuario.nome,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xff6200ee),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 5,
                                    right: 10,
                                    bottom: 5,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          widget.usuario.dtNascimento,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          widget.usuario.sexo,
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 5,
                                    right: 10,
                                    bottom: 5,
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      widget.usuario.contato,
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            child: TextButton(
                                              onPressed: () {
                                                PerfilController.instance
                                                    .changePage(PerfilController
                                                        .perfilEditarScreen);
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.deepPurple[100]),
                                              ),
                                              child: const Text(
                                                "Editar perfil",
                                                style: TextStyle(
                                                  color: Color(0xff6200ee),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            const FractionallySizedBox(
                widthFactor: 0.95, child: UltimosInteresses()),
          ],
        ),
      )),
    );
  }
}

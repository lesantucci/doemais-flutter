import 'package:doemais/usuario/controller/perfil_controller.dart';
import 'package:doemais/usuario/screens/perfil_detalhes.screen.dart';
import 'package:doemais/usuario/screens/perfil_editar.screen.dart';
import 'package:flutter/material.dart';

final List<String> listaSexo = ['Feminino', 'Masculino'];

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: AnimatedBuilder(
        animation: PerfilController.instance,
        builder: (context, child) {
          return IndexedStack(
            index: PerfilController.instance.screenIndex,
            children: [
              //PerfilDetalhesScreen(PerfilController.instance.usuario),
              PerfilEditarScreen(PerfilController.instance.usuario)
            ],
          );
        },
      ));
}

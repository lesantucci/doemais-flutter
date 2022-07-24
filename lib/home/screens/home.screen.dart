import 'package:doemais/campanha/screens/campanha.screen.dart';
import 'package:doemais/interesse/controller/interesse.controller.dart';
import 'package:doemais/interesse/services/interesse.services.dart';
import 'package:doemais/ong/screens/ong.screen.dart';
import 'package:doemais/theme/app-color.dart';
import 'package:doemais/usuario/controller/perfil_controller.dart';
import 'package:doemais/usuario/screens/interesse.screen.dart';
import 'package:doemais/usuario/screens/perfil.screen.dart';
import 'package:doemais/usuario/services/usuario.service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final usuarioService = UsuarioService();
  final interesseService = InteresseService();

  void carregarPerfil() async {
    usuarioService.consultarPerfil().then((response) {
      PerfilController.instance.changeUsuario(response);
    });
  }

  void carregarListaDeInteresses() {
    interesseService.consultarListaDeInteresses().then((lista) {
      InteresseController.instance.changeLista(lista);
    });
  }

  void selecionarTela(int index) {
    setState(() => currentIndex = index);

    // Perfil
    if (index == 3) {
      carregarPerfil();
      carregarListaDeInteresses();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: const <Widget>[
            CampanhaScreen(),
            OngScreen(),
            InteresseScreen(),
            PerfilScreen()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => selecionarTela(index),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.add_location),
              label: 'Campanhas',
              backgroundColor: AppColor.primary,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.location_city),
              label: 'ONGs',
              backgroundColor: AppColor.primary,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.done_all),
              label: 'Interesses',
              backgroundColor: AppColor.primary,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: 'Perfil',
              backgroundColor: AppColor.primary,
            )
          ],
        ),
      );
}

import 'package:doemais/campanha/screens/campanha.screen.dart';
import 'package:doemais/interesse/controller/interesse.controller.dart';
import 'package:doemais/interesse/screens/interesse.screen.dart';
import 'package:doemais/interesse/services/interesse.services.dart';
import 'package:doemais/ong/screens/ong.screen.dart';
import 'package:doemais/theme/app-color.dart';
import 'package:doemais/usuario/controller/perfil_controller.dart';
import 'package:doemais/usuario/screens/perfil.screen.dart';
import 'package:doemais/usuario/services/usuario.service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    CampanhaScreen(),
    OngScreen(),
    InteresseScreen(),
    PerfilScreen()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            
            index: currentIndex,
            children: screens,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            screens.removeAt(index);
            switch (index) {
              case 0:
                screens.insert(0, CampanhaScreen(key: UniqueKey()));
                break;
              case 1:
                screens.insert(1, OngScreen(key: UniqueKey()));
                break;
              case 2:
                screens.insert(2, InteresseScreen(key: UniqueKey()));
                break;
              case 3:
                screens.insert(3, PerfilScreen(key: UniqueKey()));
                break;
            }

            setState(() => currentIndex = index);
          },
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

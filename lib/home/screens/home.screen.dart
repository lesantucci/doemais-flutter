import 'package:doemais/campanha/screens/campanha.screen.dart';
import 'package:doemais/ong/screens/ong.screen.dart';
import 'package:doemais/theme/app-color.dart';
import 'package:doemais/usuario/screens/interesse.screen.dart';
import 'package:doemais/usuario/screens/perfil.screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

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
          onTap: (index) => setState(() => currentIndex = index),
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

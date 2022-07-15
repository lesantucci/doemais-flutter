import 'package:doemais/main.dart';
import 'package:doemais/theme/app-color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(child: Text('Home', style: TextStyle(fontSize: 60))),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add_location),
              label: 'Campanhas',
              backgroundColor: AppColor.primary,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_city),
              label: 'ONGs',
              backgroundColor: AppColor.primary,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.done_all),
              label: 'Interesses',
              backgroundColor: AppColor.primary,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
              backgroundColor: AppColor.primary,
            )
          ],
        ),
      );
}

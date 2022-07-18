import 'package:flutter/material.dart';

class OngScreen extends StatefulWidget {
  const OngScreen({Key? key}) : super(key: key);

  @override
  State<OngScreen> createState() => _OngScreenState();
}

class _OngScreenState extends State<OngScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Ongs"),
    );
  }
}

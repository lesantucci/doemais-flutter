import 'package:flutter/material.dart';

class InteresseScreen extends StatefulWidget {
  const InteresseScreen({Key? key}) : super(key: key);

  @override
  State<InteresseScreen> createState() => _InteresseScreenState();
}

class _InteresseScreenState extends State<InteresseScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Interesses"),
    );
  }
}

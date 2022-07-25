import 'package:flutter/material.dart';

class AgendaWidget extends StatefulWidget {
  AgendaWidget({Key? key}) : super(key: key);

  @override
  State<AgendaWidget> createState() => _AgendaWidgetState();
}

class _AgendaWidgetState extends State<AgendaWidget> {
  @override
  Widget build(BuildContext context) {
    return Text("Agenda");
  }
}

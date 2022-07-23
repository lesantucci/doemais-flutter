import 'package:flutter/material.dart';

class CustomTitle extends StatefulWidget {
  final String texto;

  const CustomTitle({Key? key, required this.texto}) : super(key: key);

  @override
  State<CustomTitle> createState() => _CustomTitleState();
}

class _CustomTitleState extends State<CustomTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.texto,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ));
  }
}

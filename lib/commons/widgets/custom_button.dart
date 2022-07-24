import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function onPressed;

  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 180,
      child: ElevatedButton(
        onPressed: () {
          widget.onPressed();
        },
        child: Text(widget.text),
      ),
    );
  }
}

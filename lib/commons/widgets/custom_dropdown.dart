import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  final GlobalKey<FormFieldState> state;
  final List<String> lista;
  final Function onChanged;
  final String value;

  const CustomDropdown(
      {Key? key,
      required this.label,
      required this.state,
      required this.lista,
      required this.onChanged,
      required this.value})
      : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 10),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.label,
        ),
        elevation: 16,
        key: widget.state,
        items: widget.lista.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          widget.onChanged(value);
        },
        value: widget.value,
      ),
    );
  }
}

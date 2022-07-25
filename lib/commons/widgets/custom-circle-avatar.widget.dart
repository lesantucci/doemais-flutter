import 'package:flutter/material.dart';

class CustomCircleAvatarWidget extends StatefulWidget {
  final String icon;

  const CustomCircleAvatarWidget({Key? key, required this.icon})
      : super(key: key);

  @override
  State<CustomCircleAvatarWidget> createState() =>
      _CustomCircleAvatarWidgetState();
}

class _CustomCircleAvatarWidgetState extends State<CustomCircleAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: SizedBox(
          height: 100,
          width: 100,
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.icon),
            radius: 220,
          ),
        ));
  }
}

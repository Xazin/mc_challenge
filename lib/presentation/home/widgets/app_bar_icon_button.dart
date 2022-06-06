import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;

  const AppBarIconButton(
      {Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 56,
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}

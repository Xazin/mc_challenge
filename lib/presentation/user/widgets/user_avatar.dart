import 'package:flutter/material.dart';
import 'package:mc_challenge/infrastructure/color_generator.dart';

class UserAvatar extends StatelessWidget {
  final String name;
  const UserAvatar({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: generateColor(name),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          name.substring(0, 2),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 36.0,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/painting.dart';

Color generateColor(String base) {
  final hash = base.hashCode;
  final r = (hash & 0xFF0000) >> 16;
  final g = (hash & 0x00FF00) >> 8;
  final b = hash & 0x0000FF;
  return Color.fromARGB(255, r, g, b);
}

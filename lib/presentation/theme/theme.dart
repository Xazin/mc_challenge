import 'package:flutter/material.dart';
import 'package:mc_challenge/presentation/theme/constants.dart';

final appTheme = ThemeData(
  scaffoldBackgroundColor: kScaffoldColor,
  brightness: Brightness.light,
  primarySwatch: MaterialColor(
    kPrimaryColor.value,
    const {
      50: Color(0xFFd40018),
      100: Color(0xFFbc0016),
      200: Color(0xFFa50013),
      300: Color(0xFF8d0010),
      400: Color(0xFF76000e),
      500: Color(0xFF5e000b),
      600: Color(0xFF460008),
      700: Color(0xFF2f0005),
      800: Color(0xFF170003),
      900: Color(0xFF000000),
    },
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: kPrimaryColor,
    titleTextStyle: TextStyle(
      color: kWhite,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),
);

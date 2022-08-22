import 'package:flutter/material.dart';

Color lightBackgroundColor = Color(0xFFedf0fa);
Color lightScaffoldBackgroundColor = Color(0xFFedf0fa);
Color lightLabelColor = Color(0xFF64748b);
Color lightBorderDefaultColor = Color(0xFFcbd5e1);
Color lightIconColor = Color(0xFF4f46e5);
Color darkBackgroundColor = Color(0xFF3b3934);
Color darkScaffoldBackgroundColor = Color(0xFF43474d);
Color darkLabelColor = Color(0xFFebe9e4);
Color darkIconColor = Color(0xFFf2be3a);
Color darkBorderDefaultColor = Color(0xFFcbd5e1);
Color hintColor = Colors.black26;
Color labelColor = Color(0xFF64748b);

const MaterialColor primaryBlue = MaterialColor(
  _bluePrimaryValue,
  <int, Color>{
    50: Color(0xFF4f46e5),
    100: Color(0xFF4f46e5),
    200: Color(0xFF4f46e5),
    300: Color(0xFF4f46e5),
    400: Color(0xFF4f46e5),
    500: Color(_bluePrimaryValue),
    600: Color(0xFF4f46e5),
    700: Color(0xFF4f46e5),
    800: Color(0xFF4f46e5),
    900: Color(0xFF4f46e5),
  },
);
const int _bluePrimaryValue = 0xFF4f46e5;

const MaterialColor primaryYellow = MaterialColor(
  _yellowPrimaryValue,
  <int, Color>{
    50: Color(0xFFf7db07),
    100: Color(0xFFf7db07),
    200: Color(0xFFf7db07),
    300: Color(0xFFf7db07),
    400: Color(0xFFf7db07),
    500: Color(_yellowPrimaryValue),
    600: Color(0xFFf7db07),
    700: Color(0xFFf7db07),
    800: Color(0xFFf7db07),
    900: Color(0xFFf7db07),
  },
);
const int _yellowPrimaryValue = 0xFFf7db07;

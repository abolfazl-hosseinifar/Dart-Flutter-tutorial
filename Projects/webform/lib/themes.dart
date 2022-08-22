import 'package:flutter/material.dart';
import 'package:webform_flutter/constants.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: darkScaffoldBackgroundColor,
  backgroundColor: darkScaffoldBackgroundColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryYellow)
      .copyWith(secondary: Colors.blueAccent, brightness: Brightness.dark),
);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: lightScaffoldBackgroundColor,
  backgroundColor: lightScaffoldBackgroundColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryBlue)
      .copyWith(secondary: Colors.blueAccent, brightness: Brightness.light),
);

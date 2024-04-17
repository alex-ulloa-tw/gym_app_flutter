import 'package:flutter/material.dart';

const colorsList = <Color>[
  Colors.black,
  Colors.red,
  Colors.teal,
  Colors.orange
];

class AppTheme {
  ThemeData getTheme() => ThemeData(
      colorSchemeSeed: colorsList[3],
      useMaterial3: true,
      brightness: Brightness.dark);
}

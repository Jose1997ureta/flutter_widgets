import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.brown
];

class AppTheme {
  final int selectedColors;

  AppTheme({this.selectedColors = 0})
      : assert(selectedColors >= 0, "Selected color must be greater then 0"),
        assert(selectedColors < colorList.length,
            "Selected color must be less or equal than ${colorList.length - 1}");

  ThemeData getTheme() => ThemeData(colorSchemeSeed: colorList[selectedColors]);
}

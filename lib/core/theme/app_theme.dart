import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = FlexThemeData.light(
    background: Colors.grey[300],
    scheme: FlexScheme.blue,
    useMaterial3: true,
    fontFamily: 'Inter',
  );

  static ThemeData darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.blue,
    useMaterial3: true,
    fontFamily: 'Inter',
  );
}

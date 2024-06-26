import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  useMaterial3: false,
  fontFamily: 'Sen',
  primaryColor: const Color(0xFF3B9EFB),
  secondaryHeaderColor: const Color(0xFF000743),
  disabledColor: const Color(0xFF000000),
  brightness: Brightness.light,
  hintColor: const Color(0xFFFFA216),
  cardColor: Colors.white,
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color(0xFFC02332))), colorScheme: const ColorScheme.light(primary: Color(0xFFC02332), secondary: Color(0xFFC02332)).copyWith(error: const Color(0xFFC02332)),
);
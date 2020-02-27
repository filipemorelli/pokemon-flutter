import 'package:flutter/material.dart';

const Color kRed = Colors.red;
const double kSpaceSize = 10.0;
const double kElevation = 5;
const double imagePokemonSize = 96.0;

ThemeData kThemeData = ThemeData(
  primarySwatch: kRed,
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    elevation: kElevation,
  ),
  cardTheme: CardTheme(
    elevation: kElevation,
  ),
);

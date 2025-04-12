import 'package:filore/src/utils/constants/colors.dart';
import 'package:filore/src/utils/theme/custom_theme/filled_button_theme.dart';
import 'package:filore/src/utils/theme/custom_theme/input_theme.dart';
import 'package:filore/src/utils/theme/custom_theme/text_button_theme.dart';
import 'package:filore/src/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class FiloreTheme {
  FiloreTheme._();

  //light mode theme
  static final lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: white,
    textTheme: FTextTheme.lightTextTheme,
    brightness: Brightness.light,
    filledButtonTheme: FFilledButtonTheme.lightFilledButtonTheme,
    textButtonTheme: FTextButtonTheme.lightTextButtonTheme,
    inputDecorationTheme: FInputTheme.lightInputTheme,
  );
  //dark mode theme
  static final darkModeTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: black,
    textTheme: FTextTheme.darkTextTheme,
    brightness: Brightness.dark,
    filledButtonTheme: FFilledButtonTheme.darkFilledButtonTheme,
    textButtonTheme: FTextButtonTheme.darkTextButtonTheme,
    inputDecorationTheme: FInputTheme.darkInputTheme,
  );
}

import 'package:filore/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class FFilledButtonTheme {
  FFilledButtonTheme._();

  //light mode filled
  static final lightFilledButtonTheme = FilledButtonThemeData(
    style: ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size(140, 33)),
      maximumSize: const WidgetStatePropertyAll(Size(140, 33)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      backgroundColor: WidgetStatePropertyAll(black),
    ),
  );

  //light mode filled
  static final darkFilledButtonTheme = FilledButtonThemeData(
    style: ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size(140, 33)),
      maximumSize: const WidgetStatePropertyAll(Size(140, 33)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      backgroundColor: WidgetStatePropertyAll(white),
    ),
  );
}

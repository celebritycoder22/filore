import 'package:filore/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class FTextButtonTheme {
  FTextButtonTheme._();

  //light mode filled
  static final lightTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size(140, 33)),
      maximumSize: const WidgetStatePropertyAll(Size(140, 33)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      //s
      backgroundColor: WidgetStatePropertyAll(black),
      // textStyle:
      //     WidgetStatePropertyAll(GoogleFonts.poppins(color: Colors.pink)),
    ),
  );

  //light mode filled
  static final darkTextButtonTheme = TextButtonThemeData(
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

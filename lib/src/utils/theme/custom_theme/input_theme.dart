import 'package:filore/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FInputTheme {
  FInputTheme._();

  static final lightInputTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    hintStyle: GoogleFonts.poppins(
        fontSize: 14, color: const Color.fromARGB(255, 75, 75, 75)),
    filled: true,
    fillColor: fGrey,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(14),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: green),
      borderRadius: BorderRadius.circular(14),
    ),
  );
  static final darkInputTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    hintStyle: GoogleFonts.poppins(fontSize: 14, color: fGrey),
    filled: true,
    fillColor: const Color.fromARGB(255, 31, 31, 31),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(14),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: const Color.fromARGB(255, 31, 176, 89)),
      borderRadius: BorderRadius.circular(14),
    ),
  );
}

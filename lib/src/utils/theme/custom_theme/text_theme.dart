import 'package:filore/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FTextTheme {
  FTextTheme._();

  //light mode text theme
  static final lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.poppins(fontSize: 16, color: black),
    bodyMedium: GoogleFonts.poppins(fontSize: 14, color: black),
    bodySmall: GoogleFonts.poppins(fontSize: 12, color: black),
    //
    titleMedium: GoogleFonts.poppins(fontSize: 19, color: black),
    //
    labelMedium: GoogleFonts.poppins(fontSize: 15, color: black),
  );

  //dark mode text theme
  static final darkTextTheme = TextTheme(
    bodyLarge: GoogleFonts.poppins(fontSize: 16, color: white),
    bodyMedium: GoogleFonts.poppins(fontSize: 14, color: white),
    bodySmall: GoogleFonts.poppins(fontSize: 12, color: white),
    //
    titleMedium: GoogleFonts.poppins(fontSize: 19, color: white),
    //
    labelMedium: GoogleFonts.poppins(fontSize: 15, color: white),
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        /*appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 106, 208, 80)),
        */
        textTheme: GoogleFonts.latoTextTheme());
  }
}

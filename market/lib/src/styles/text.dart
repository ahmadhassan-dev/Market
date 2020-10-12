import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market/src/styles/colors.dart';

abstract class TextStyles {
  static TextStyle body() {
    return GoogleFonts.roboto(
      textStyle: TextStyle(color: AppColors.darkGrey(), fontSize: 16.0),
    );
  }

  static TextStyle suggestion() {
    return GoogleFonts.roboto(
      textStyle: TextStyle(color: AppColors.lightGrey(), fontSize: 14.0),
    );
  }

  static TextStyle error() {
    return GoogleFonts.roboto(
      textStyle: TextStyle(color: AppColors.red(), fontSize: 12.0),
    );
  }

  static TextStyle link() {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
          color: AppColors.straw(),
          fontSize: 16.0,
          fontWeight: FontWeight.bold),
    );
  }

  static TextStyle buttonTextLight() {
    return GoogleFonts.roboto(
        textStyle: TextStyle(
            color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold));
  }

  static TextStyle buttonTextDark() {
    return GoogleFonts.roboto(
        textStyle: TextStyle(
            color: AppColors.darkGrey(),
            fontSize: 17.0,
            fontWeight: FontWeight.bold));
  }
}

import 'package:coffee_shop/helpers/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class BoldTextStyle {
  static TextStyle bold16 = GoogleFonts.sora(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Appcolors.appBoldTextBlack);

  static TextStyle bold14 = GoogleFonts.sora(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Appcolors.appBoldTextBlack);

  static TextStyle light16 = GoogleFonts.sora(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Appcolors.appTextLightBlack);

  static TextStyle light14 = GoogleFonts.sora(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Appcolors.appTextLightBlack);

  static TextStyle light12 = GoogleFonts.sora(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Appcolors.appTextLightBlack);
}

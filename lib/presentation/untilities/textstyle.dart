


// FONT WEIGHT
import 'package:elemes_app/presentation/untilities/sizedfont.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight bold = FontWeight.w700;
FontWeight semibold = FontWeight.w600;

class TextStyleCustom {
  TextStyleCustom._internalConstructor();

  static final TextStyleCustom _instance = TextStyleCustom._internalConstructor();

  factory TextStyleCustom() {
    return _instance;
  }
  static TextStyle superLargeInter = GoogleFonts.inter(
    fontSize: SizedFont.fontSizeSuperLarge,
  );

  static TextStyle overLargeInter = GoogleFonts.inter(
    fontSize: SizedFont.fontSizeOverLarge,
  );

  static TextStyle extraLargeInter = GoogleFonts.inter(
    fontSize: SizedFont.fontSizeExtraLarge,
  );

  static TextStyle largeInter = GoogleFonts.inter(
    fontSize: SizedFont.fontSizeLarge,
  );

  static TextStyle regularInter = GoogleFonts.inter(
    fontSize: SizedFont.fontSizeDefault,
  );

  static TextStyle buttonInter = GoogleFonts.inter(
    fontSize: SizedFont.fontSizeDefault,
  );

  static TextStyle smallInter = GoogleFonts.inter(
    fontSize: SizedFont.fontSizeSmall,
  );

  static TextStyle extraSmallInter = GoogleFonts.inter(
    fontSize: SizedFont.fontSizeExtraSmall,
  );
}

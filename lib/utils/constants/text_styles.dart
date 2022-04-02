import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

TextStyle smallText = GoogleFonts.ptSans(
  fontSize: 12,
  fontWeight: FontWeight.normal,
);

TextStyle normalText = GoogleFonts.ptSansCaption(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    textStyle: const TextStyle(color: color_white));

TextStyle normalTextOverflow = GoogleFonts.ptSansCaption(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    textStyle:
        const TextStyle(color: color_white, overflow: TextOverflow.ellipsis));

TextStyle mediumText = GoogleFonts.ptSans(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    textStyle: const TextStyle(color: color_white));

TextStyle largeText = GoogleFonts.ptSans(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    textStyle: const TextStyle(color: color_white));

TextStyle extraLargeText = GoogleFonts.ptSans(
  fontSize: 35,
  fontWeight: FontWeight.bold,
);

TextStyle xxLargeText = GoogleFonts.ptSans(
  fontSize: 45,
);

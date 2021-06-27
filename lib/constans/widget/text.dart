import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Single Text:
sText(String title, Color color, double size, FontWeight weight) {
  return Text(title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.openSans(
          color: color, fontSize: size, fontWeight: weight));
}

//Limit Text:
lText(String title, Color color, double size, FontWeight weight, int line) {
  return Text(title,
      maxLines: line,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.openSans(
          color: color, fontSize: size, fontWeight: weight));
}

//Multi Text:
mText(String title, Color color, double size, FontWeight weight) {
  return Text(title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.openSans(
          color: color, fontSize: size, fontWeight: weight));
}

//style
cStyle(Color color, double size, FontWeight weight) {
  return GoogleFonts.openSans(color: color, fontSize: size, fontWeight: weight);
}

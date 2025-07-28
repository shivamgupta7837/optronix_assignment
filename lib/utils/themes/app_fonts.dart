import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:optronix_assignment/utils/themes/app_colors.dart';

class AppFonts {
  final _defualtTextColor = AppColors().fontColor;
  Text appBarHeading(String text, {Color? fontColor}) {
    final color = fontColor ?? _defualtTextColor;
    return Text(
      text,
      style: GoogleFonts.openSans(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text heading(String text,{Color? fontColor}) {
     final color = fontColor ?? _defualtTextColor;
    return Text(
      text,
      style: GoogleFonts.openSans(
        color:color,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Text subHeading(String text,{Color? fontColor}) {
     final color = fontColor ?? _defualtTextColor;
    return Text(
      text,
      style: GoogleFonts.openSans(
        color:color,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text smallText(String text,{Color? fontColor}) {
     final color = fontColor ?? _defualtTextColor;
    return Text(
      text,
      style: GoogleFonts.openSans(
        color:color,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

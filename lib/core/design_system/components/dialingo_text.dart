import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialingoText extends StatelessWidget {
  const DialingoText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    this.isTextAlignCenter = true,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final bool isTextAlignCenter;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: isTextAlignCenter ? TextAlign.center : null
    );
  }
}

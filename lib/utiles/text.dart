import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Modified_text extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const Modified_text(
      {super.key, required this.text, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lilitaOne(color: color, fontSize: size),
    );
  }
}

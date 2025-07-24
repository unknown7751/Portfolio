import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CenterTitleHome extends StatelessWidget {
  Color heighlight = Color.fromARGB(255, 104, 30, 195);

  CenterTitleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 40,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
        children: [
          TextSpan(text: 'Build ', style: TextStyle(color: heighlight)),
          TextSpan(text: 'things.\n'),
          TextSpan(text: 'Break ', style: TextStyle(color: heighlight)),
          TextSpan(text: 'things.\n'),
          TextSpan(text: 'Learn ', style: TextStyle(color: heighlight)),
          TextSpan(text: 'fast.'),
        ],
      ),
    );
  }
}

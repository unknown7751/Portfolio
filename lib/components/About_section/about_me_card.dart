import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF101026),
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 0.2, color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'Tech enthusiast with a passion for\ndevelopment.',
          textAlign: TextAlign.left,
          style: GoogleFonts.poppins(
            decoration: TextDecoration.none,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EduCard extends StatelessWidget{
  const EduCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 0.2,color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      color: const Color(0xFF101026),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RichText(text: TextSpan(
          children: [
            TextSpan(
              text: 'Education\n',
              style: GoogleFonts.poppins(
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      )
            ),
            TextSpan(
              text: 'B.Tech in CSE\n',
              style: GoogleFonts.sourceSans3(
                color: Colors.white54,
                decoration: TextDecoration.none,
                fontSize: 16
              )
            ),
            TextSpan(
              text: 'Shri Ramdeobaba College of Engineering\n',
              style: GoogleFonts.sourceSans3(
                color: Colors.white60,
                decoration: TextDecoration.none,
                fontSize: 19
              )
            ),
            TextSpan(
              text: '2023-27\n',
              style: GoogleFonts.sourceSans3(
                color: Colors.white60,
                decoration: TextDecoration.none,
                fontSize: 16
              )
            )
          ]
        )),
      )
    );
  }
}

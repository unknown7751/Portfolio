import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EduCard extends StatelessWidget{
  const EduCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(width: 0.2,color: Colors.white),
        color: const Color(0xFF101026),
        borderRadius: BorderRadius.circular(20),
      ),
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
      ))
    );
  }
}

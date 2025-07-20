import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AboutMeCard extends StatelessWidget {

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
      child: Text('Tech enthusiast with a passion for development.',textAlign: TextAlign.right,style: GoogleFonts.poppins(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),),
    );
  }
}
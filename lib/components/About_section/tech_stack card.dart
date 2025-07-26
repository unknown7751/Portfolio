import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components/infinite_scroll_screen.dart';
class TechStackCard extends StatelessWidget {
  final List<String> techs = [
    "Flutter",
    "Python",
    "Java",
    "SQL",
  ];

  final List<String> skills = ["DSA","OOPS","DAA",  "Javascript"];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF101026),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0.2,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            // Left Text Column
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(
                    "I constantly try to improve",
                    style: GoogleFonts.poppins(
                      decoration: TextDecoration.none,
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "My tech\nstack",
                    style: GoogleFonts.poppins(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
        
            const SizedBox(width: 20),
            
            // Right Scrollable Tags Column
            Expanded(
              flex: 2,
              child: InfiniteScroll(items: techs)
            )
          ],
        ),
      )
    );
  }
}
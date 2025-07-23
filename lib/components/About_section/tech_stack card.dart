import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TechStackCard extends StatelessWidget {
  final List<String> techs = [
    "Flutter",
    "Python",
    "Java",
    "SQL",
    "Javascript",
  ];

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
                    "My tech stack",
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
              child: SingleChildScrollView(
                child: Column(
                  children: techs
                      .map((tech) => Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1B1B3A),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              tech,
                              style: GoogleFonts.poppins(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/mobile_view.dart';


class TechStackCard extends StatelessWidget {
  TechStackCard({super.key,required this.mbView});
  bool mbView;
  final List<String> techs = ["Python", "Java", "SQL", "CPP", "C"];

  final List<String> frontend = ["Flutter","HTML","CSS","Javascript"];

  final List<String> skills = ["DSA", "OOPS", "DAA"];

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
        child: Row(
          children: [
            // Left Text Column
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
            !mbView ?
            Expanded(
              flex: 2,
              child: Row(
                spacing: 40,
                children: [
                  Column(
                    spacing: 0.5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: skills.map((w) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1.0),
                            child: Container(
                              width: 60,
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1B1B3A),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                w,
                                style: GoogleFonts.poppins(
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: frontend.map((s) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1.0),
                            child: Container(
                              width: 80,
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1B1B3A),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                s,
                                style: GoogleFonts.poppins(
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: techs.map((s) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1.0),
                            child: Container(
                              width: 80,
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1B1B3A),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                s,
                                style: GoogleFonts.poppins(
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                  ),
                ],
              ),
            ) : 
            SingleChildScrollView(
              child: Column(
                children: [
                  ...skills.map((w) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1.0),
                            child: Container(
                              width: 80,
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1B1B3A),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                w,
                                style: GoogleFonts.poppins(
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      }),
                  ...frontend.map((w) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1.0),
                            child: Container(
                              width: 80,
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1B1B3A),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                w,
                                style: GoogleFonts.poppins(
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      }),
                  ...techs.map((w) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1.0),
                            child: Container(
                              width: 80,
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1B1B3A),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                w,
                                style: GoogleFonts.poppins(
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

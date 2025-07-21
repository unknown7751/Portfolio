import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectBox extends StatelessWidget {
  ProjectBox({
    super.key,
    required this.img,
    required this.title,
    required this.summary,
    required this.subSummary,
    required this.link,
    required this.scale,
  });

  String img = '';
  String title = '';
  String summary = '';
  String subSummary = '';
  String link = '';
  double scale = 1.0;

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF13162D),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0.2,color: Colors.white
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.only(top :20.0),
        child: SizedBox(
          width: 355,
          child: Column(
            children: [
              Container(
                width: 300,
                height: 179.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.1, color: Colors.white),
                ),
                child: Stack(
                  children: [
                    Image.asset('assets/prjctbg.png'),
                    Align(alignment: Alignment.bottomCenter,child: Image.asset(scale: scale,img)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300, // Match the image width or desired width
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: 300, // Match the image width or desired width
                child: Text(
                  summary,
                  style: GoogleFonts.poppins(
                    color: Colors.white54,
                    decoration: TextDecoration.none,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              if (subSummary != '')
                Container(
                  width: 300,
                  child: Text(
                    subSummary,
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(146, 255, 255, 255),
                      decoration: TextDecoration.none,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              TextButton.icon(
                icon: FaIcon(
                  FontAwesomeIcons.arrowUpRightFromSquare,
                  color: Color.fromARGB(255, 163, 147, 253),
                  size: 15,
                ),
                onPressed: _launchURL,
                label: Text(
                  'View Repository',
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 163, 147, 253),
                    decoration: TextDecoration.none,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Card()
            ],
          ),
        ),
      ),
    );
  }
}

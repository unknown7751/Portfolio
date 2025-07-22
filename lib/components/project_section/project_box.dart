import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart';

class ProjectBox extends StatefulWidget {
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

  @override
  State<ProjectBox> createState() => _ProjectBoxState();
}

class _ProjectBoxState extends State<ProjectBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Future<void> _launchURL() async {
    final Uri url = Uri.parse(widget.link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: Center(
        child: Card(
          color: Color(0xFF13162D),
          shape: RoundedRectangleBorder(
            // side: BorderSide(width: 0.2, color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
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
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(scale: widget.scale, widget.img),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 300, // Match the image width or desired width
                    child: Text(
                      widget.title,
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
                      widget.summary,
                      style: GoogleFonts.poppins(
                        color: Colors.white54,
                        decoration: TextDecoration.none,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  if (widget.subSummary != '')
                    Container(
                      width: 300,
                      child: Text(
                        widget.subSummary,
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
                  Card(),
                ],
              ),
            ),
          ),
        ),
      ),
      builder:
          (context, child) => Container(
            padding: EdgeInsets.all(0.7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: SweepGradient(
                center: Alignment.center,
                startAngle: 0,
                endAngle: (2*math.pi),
                stops: [0.9,1],
                transform: GradientRotation(_animationController.value * 2 * 3.14 ),
                colors: [
                Color.fromARGB(255, 0, 0, 0),Color.fromARGB(255, 163, 147, 253)]),
            ),
            width: 355,
            child: child,
          ),
    );
  }
}

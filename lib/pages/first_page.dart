import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components/center_title_home.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://github.com/unknown7751');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {
    return 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top : 200),
                child: CenterTitleHome(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 175),
                child: TextButton.icon(
                  onPressed: _launchURL,
                  icon: const FaIcon(
                    FontAwesomeIcons.github,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'GitHub',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    fixedSize:  const Size(110,40),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 103, 103, 103),
                        width: 0.9,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }
  
  
  
  
  
  
  
  
  
  
  
}

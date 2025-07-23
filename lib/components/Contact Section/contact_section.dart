import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget{
  ContactSection({super.key});
  Future<void> _launchURL(String l) async {
    final Uri url = Uri.parse(l);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(
          width: 0.4,color: Colors.white54,
        )),
        color: const Color.fromARGB(255, 16, 16, 34),
      ),
      height: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(textAlign: TextAlign.center,text: TextSpan(
            children: [
              TextSpan(text: "Let's ", style: GoogleFonts.poppins(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),),
              TextSpan(text: "connect!\n", style: GoogleFonts.poppins(
                      decoration: TextDecoration.none,
                      color: Color.fromARGB(255, 163, 147, 253),
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),),
              TextSpan(text: "Find me on these platforms:", style: GoogleFonts.poppins(
                      decoration: TextDecoration.none,
                      color: Colors.white54,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),),
            ]
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){
                _launchURL('https://github.com/unknown7751');
              }, icon: const FaIcon(FontAwesomeIcons.github, color: Colors.white),iconSize: 26,),
              Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25),
                child: IconButton(onPressed: (){
                  _launchURL('https://www.linkedin.com/in/aryan-jawanjal-8049a2332/');
                }, icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),iconSize: 26,),
              ),
              IconButton(onPressed: (){
                _launchURL('https://www.instagram.com/aryan_77_51/');
              }, icon: const FaIcon(FontAwesomeIcons.instagram, color: Colors.white),iconSize: 26,),
            ],
          ),
        ],
      ),
    );
  }
}
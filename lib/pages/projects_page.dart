import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components/project_box.dart';

class ProjectsPage extends StatelessWidget {
  ProjectsPage({super.key});
  final TextStyle s1 = GoogleFonts.poppins(
    color: Colors.white,
    decoration: TextDecoration.none,
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Text(
            'My Work',
            style: GoogleFonts.poppins(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 23,
              fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ProjectBox(img: 'abc.png', title: 'Prjct1', summary: 'Prjct1', link: 'Prjct1', langs: ['js','java'])
      ],
    );
  }
}

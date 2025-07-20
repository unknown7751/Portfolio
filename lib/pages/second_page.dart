import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/components/about_me_card.dart';
import 'package:portfolio/components/edu_card.dart';
import 'package:portfolio/components/leetcode_card.dart';
import 'package:portfolio/components/tech_stack%20card.dart';
import 'package:portfolio/pages/projects_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
        
          children: [
            TechStackCard(),
            SizedBox(height: 10,),
            AboutMeCard(),
            SizedBox(height: 10,),
            LeetCodeStats(),
            SizedBox(height: 10,),
            EduCard(),
            SizedBox(height: 30,),
            ProjectsPage()
          ],
        ),
      ),
    );
  }
}

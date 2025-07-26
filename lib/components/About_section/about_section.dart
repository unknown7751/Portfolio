import 'package:flutter/material.dart';
import 'package:portfolio/components/About_section/about_me_card.dart';
import 'package:portfolio/components/About_section/edu_card.dart';
import 'package:portfolio/components/About_section/leetcode_card.dart';
import 'package:portfolio/components/About_section/tech_stack%20card.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 977) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Left Column - Fixed width and spacing
          Column(
            children: [
              // About Me Card - Fixed height 250px
              SizedBox(height: 250, width: 350, child: AboutMeCard()),
              const SizedBox(height: 24), // Consistent spacing
              // Education Card - Fixed height 250px
              const SizedBox(height: 250, child: EduCard()),
            ],
          ),

          const SizedBox(width: 5), // Fixed gap between columns
          // Right Column - Fixed width and spacing
          Column(
            children: [
              // Tech Stack Card - Fixed height 250px
              SizedBox(height: 250, width: 400, child: TechStackCard()),
              const SizedBox(height: 24), // Consistent spacing
              // LeetCode Stats Card - Fixed height 250px
              const SizedBox(height: 250, width: 400, child: LeetCodeStats()),
            ],
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 250, width: 350, child: AboutMeCard()),
          const SizedBox(height: 24), // Consistent spacing
          // Education Card - Fixed height 250px
          const SizedBox(height: 250, child: EduCard()),
          SizedBox(height: 250, width: 400, child: TechStackCard()),
          const SizedBox(height: 24), // Consistent spacing
          // LeetCode Stats Card - Fixed height 250px
          const SizedBox(height: 250, width: 400, child: LeetCodeStats()),
        ],
      );
    }
  }
}

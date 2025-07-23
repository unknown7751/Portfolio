import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/center_title_home.dart';
import 'package:portfolio/components/first_page/animated_name.dart';
import 'package:portfolio/components/home_github_button.dart';
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
                child: Column(
                  children: [
                    AnimatedName(),
                    CenterTitleHome(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 175),
                child: HomeGithubButton(),
                
              ),
            ],
          ),
        );
  }
}

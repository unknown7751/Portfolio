import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/center_title_home.dart';
import 'package:portfolio/components/first_page/animated_name.dart';
import 'package:portfolio/components/first_page/home_github_button.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
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
                padding: const EdgeInsets.only(top: 8.0,bottom: 150),
                child: HomeGithubButton(),
              ),
            ],
          ),
        );
  }
}

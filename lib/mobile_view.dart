import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/first_page.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/bg.png',
          fit: BoxFit.cover,
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
        ),

        Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromRGBO(0, 0, 0, 0.65),
        ),

        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: SizedBox(width: double.infinity, height: double.infinity),
        ),
        PageView(
          scrollDirection: Axis.vertical,
          children: [
            FirstPage()
          ],
        ),
      ],
    );
  }
}

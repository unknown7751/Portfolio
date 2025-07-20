import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/mypageview.dart';
import 'package:portfolio/pages/first_page.dart';
import 'package:portfolio/pages/second_page.dart';

class MobileView extends StatefulWidget {
  final int? currentPage;
  final ValueChanged<int>? onPageChanged;
  final PageController pageController; // Add this

  MobileView({
    super.key,
    required this.currentPage,
    required this.pageController,
    this.onPageChanged,
  });

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
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
        MyPageView(
          cpage: widget.currentPage,
          pageController: widget.pageController, // Pass controller
          onPageChanged: widget.onPageChanged,
        )
      ],
    );
  }
}

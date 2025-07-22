import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components/about_me_card.dart';
import 'package:portfolio/components/edu_card.dart';
import 'package:portfolio/components/leetcode_card.dart';
import 'package:portfolio/components/project_box.dart';
import 'package:portfolio/components/tech_stack%20card.dart';
import 'package:portfolio/pages/first_page.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MobileView extends StatefulWidget {
  MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  late Color defaultColor;
  late List<bool> _visible;
  late Color selectedColor;
  int currentPage = 0;
  late List<Color> buttonColor;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    defaultColor = Color.fromARGB(255, 131, 131, 131);
    selectedColor = Colors.white;
    buttonColor = [selectedColor, defaultColor, defaultColor];
    _visible = List.filled(3, false);
  }

  late var page = [
    FirstPage(),
    Center(child: SizedBox(width: 350, height: 200, child: TechStackCard())),
    Center(child: SizedBox(width: 350, height: 200, child: AboutMeCard())),
    Center(child: SizedBox(width: 350, height: 250, child: LeetCodeStats())),
    Center(child: SizedBox(width: 350, height: 200, child: EduCard())),
    SizedBox(height: 30),
    Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Text(
        'My Work',
        style: GoogleFonts.poppins(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontSize: 27,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    ),
    Align(
      child: ProjectBox(
        img: 'assets/prjct11.png',
        title: 'AI Flashcard App',
        summary:
            'AI-powered Flutter app to create flashcards from text or documents—fast and easy.',
        subSummary: '',
        link: 'https://github.com/unknown7751/AIFlashcardApp',
        scale: 5,
      ),
    ),
    SizedBox(height: 10),
    Align(
      child: ProjectBox(
        img: 'assets/prjct21.png',
        title: 'SnipShare',
        summary: 'A code sharing web app',
        subSummary: 'played a role in this project\'s development.',
        link: 'https://github.com/Auxilus08/SnipShare',
        scale: 2,
      ),
    ),
    SizedBox(height: 10),
    Align(
      child: ProjectBox(
        img: 'assets/prjct31.png',
        title: 'Sign Language App',
        summary:
            'Videos, quizzes, and text-to-sign for learning sign language.',
        subSummary: 'Involved in this project\'s creation.',
        link: 'https://github.com/unknown7751/SignLanguageApp_Java',
        scale: 2,
      ),
    ),
  ];

  double _getWidgetHeight(Widget widget) {
    if (widget is FirstPage) return 600.0; 
    if (widget is Center && widget.child is SizedBox) {
      SizedBox sizedBox = widget.child as SizedBox;
      return sizedBox.height ?? 0.0;
    }
    if (widget is Padding) return 800.0;
    if (widget is SizedBox) return widget.height ?? 0.0;
    return 300.0; 
  }

  void onBarClick(int selectedButtonIndex) {
    setState(() {
      buttonColor[currentPage] = defaultColor;

      currentPage = selectedButtonIndex;
      buttonColor[currentPage] = selectedColor;
    });

    double targetOffset = 0.0;
    int targetPageIndex = 0; 

    if (selectedButtonIndex == 0) {
      // Home
      targetPageIndex = 0; 
    } else if (selectedButtonIndex == 1) {
      targetPageIndex = 2;
    } else if (selectedButtonIndex == 2) {
      // Projects
      targetPageIndex = 6;
    }

    for (int i = 0; i < targetPageIndex; i++) {
      targetOffset += _getWidgetHeight(page[i]);
    }

    targetOffset -=
        100;

    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }


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
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor:
                  Colors
                      .transparent,
              elevation: 0,
              pinned: true,
              floating: true,
              snap: true,
              expandedHeight: 120,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5,
                          sigmaY: 5,
                        ), 
                        child: Container(
                          color: Color.fromRGBO(
                            0,
                            0,
                            0,
                            0.5,
                          ), 
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () => onBarClick(0),
                              child: Text(
                                'Home',
                                style: GoogleFonts.poppins(
                                  color: buttonColor[0],
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 14.0,
                                right: 14,
                              ),
                              child: TextButton(
                                onPressed: () => onBarClick(1),
                                child: Text(
                                  'About',
                                  style: TextStyle(
                                    color: buttonColor[1],
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => onBarClick(2),
                              child: Text(
                                'Projects',
                                style: TextStyle(
                                  color: buttonColor[2],
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  // If index is 0, return FirstPage
                  if (index == 0) {
                    return FirstPage();
                  }
                  // If index is 1, return TechStackCard
                  else if (index == 1) {
                    return Center(
                      child: SizedBox(
                        width: 350,
                        height: 200,
                        child: TechStackCard(),
                      ),
                    );
                  }
                  else if (index >= 2 && index < 5) {
                    final int page2Index = index;
                    return VisibilityDetector(
                      key: Key('item-$page2Index'),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.1 &&
                            !_visible[page2Index - 2]) {
                          setState(() {
                            _visible[page2Index - 2] = true;
                          });
                        }
                      },
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 600),
                        opacity: _visible[page2Index - 2] ? 1.0 : 0.0,
                        child: page[page2Index],
                      ),
                    );
                  }
                  else if (index == 2 + 3) {
                    return SizedBox(height: 30);
                  } else if (index == 2 + 3 + 1) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Text(
                        'My Work',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 27,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  return page[index]; // Fallback
                },
                childCount:
                    page.length,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

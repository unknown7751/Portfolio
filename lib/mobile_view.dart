import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components/About_section/about_me_card.dart';
import 'package:portfolio/components/About_section/edu_card.dart';
import 'package:portfolio/components/About_section/leetcode_card.dart';
import 'package:portfolio/components/Contact%20Section/contact_section.dart';
import 'package:portfolio/components/nav_bar.dart';
import 'package:portfolio/components/project_section/project_box.dart';
import 'package:portfolio/components/About_section/tech_stack%20card.dart';
import 'package:portfolio/pages/first_page.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MobileView extends StatefulWidget {
  MobileView({super.key, required this.scrollController});
  ScrollController scrollController;

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  late Color defaultColor;
  late List<bool> _visible;
  late Color selectedColor;
  int currentPage = 0;
  late List<Color> buttonColor;
  late ScrollController _scrollController;
  late Map<int, double> _sectionOffsets;
  bool op = false;
  double cWidth = 355;
  double imgWidth = 300;
  double cHeight = 340;
  double imgHeight = 179.3;
  late var page = [
    Padding(
      padding: const EdgeInsets.only(bottom : 70.0),
      child: FirstPage(),
    ),
    Center(child: SizedBox(width: cWidth, height: 250, child: TechStackCard(mbView: true,))),
    Center(child: SizedBox(width: cWidth, height: 250, child: AboutMeCard())),
    Center(child: SizedBox(width: cWidth, height: 250, child: LeetCodeStats(chartH: 130,chartW: 130,))),
    Center(child: SizedBox(width: cWidth, height: 250, child: EduCard())),
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
    Center(
      child: ProjectBox(
        contWidth: cWidth,
        contheight: cHeight,
        imgWidth: imgWidth,
        imgHeight: imgHeight,
        img: 'assets/prjct11.webp',
        title: 'AI Flashcard App',
        summary:
            'AI-powered Flutter app to create flashcards from text or documents—fast and easy.',
        subSummary: '',
        link: 'https://github.com/unknown7751/AIFlashcardApp',
        scale: 5,
      ),
    ),
    SizedBox(height: 10),
    Center(
      child: ProjectBox(
        contWidth: cWidth,
        contheight: cHeight,
        imgWidth: imgWidth,
        imgHeight: imgHeight,
        img: 'assets/prjct21.webp',
        title: 'SnipShare',
        summary: 'A code sharing web app',
        subSummary: 'played a role in this project\'s development.',
        link: 'https://github.com/Auxilus08/SnipShare',
        scale: 2,
      ),
    ),
    SizedBox(height: 10),
    Center(
      child: ProjectBox(
        contWidth: cWidth,
        contheight: cHeight,
        imgWidth: imgWidth,
        imgHeight: imgHeight,
        img: 'assets/prjct31.webp',
        title: 'Sign Language App',
        summary:
            'Videos, quizzes, and text-to-sign for learning sign language.',
        subSummary: 'Involved in this project\'s creation.',
        link: 'https://github.com/unknown7751/SignLanguageApp_Java',
        scale: 2,
      ),
    ),
    SizedBox(height: 10),
    ContactSection(),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController;
    defaultColor = Color.fromARGB(255, 131, 131, 131);
    selectedColor = Colors.white;
    buttonColor = [selectedColor, defaultColor, defaultColor, defaultColor];
    _visible = List.filled(3, false);
    _sectionOffsets = {};
    _calculateSectionOffsets();

    _scrollController.addListener(_scrollListener);
  }

  void _calculateSectionOffsets() {
    double currentOffset = 0.0;
    _sectionOffsets[0] = currentOffset;
    currentOffset += _getWidgetHeight(page[0]);
    _sectionOffsets[1] = currentOffset;

    for (int i = 1; i <= 5; i++) {
      currentOffset += _getWidgetHeight(page[i]);
    }
    _sectionOffsets[2] = currentOffset;

    for (int i = 6; i <= 10; i++) {
      currentOffset += _getWidgetHeight(page[i]);
    }
    _sectionOffsets[3] = currentOffset;
    _sectionOffsets.updateAll((key, value) => value - 50); // Adjust as needed
  }

  void _scrollListener() {
    if (!_scrollController.hasClients) return; // Ensure controller is attached

    double currentOffset = _scrollController.offset;
    int newCurrentPage = currentPage;

    // Iterate through sections to find which one is currently visible
    // We check from the bottom up to ensure the lowest visible section is picked
    if (currentOffset >= _sectionOffsets[3]!) {
      newCurrentPage = 3; // Contact
    } else if (currentOffset >= _sectionOffsets[2]!) {
      newCurrentPage = 2; // Projects
    } else if (currentOffset >= _sectionOffsets[1]!) {
      setState(() {
        op = true;
      });
      newCurrentPage = 1; // About
    } else {
      setState(() {
        op = false;
      });
      newCurrentPage = 0; // Home
    }

    // Only update state if the active page has changed
    if (newCurrentPage != currentPage) {
      setState(() {
        buttonColor[currentPage] = defaultColor; // Set previous to default
        currentPage = newCurrentPage; // Update current page
        buttonColor[currentPage] = selectedColor; // Set new current to selected
      });
    }
  }

  double _getWidgetHeight(Widget widget) {
    if (widget is FirstPage) return 600.0;
    if (widget is Center && widget.child is SizedBox) {
      SizedBox sizedBox = widget.child as SizedBox;
      return sizedBox.height ?? 0.0;
    }
    if (widget is Padding) return 800.0;
    if (widget is SizedBox) return widget.height ?? 0.0;
    if (widget is ContactSection)
      return 300.0; // Estimate height for ContactSection
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
    } else if (selectedButtonIndex == 3) {
      targetPageIndex = 14;
    }

    for (int i = 0; i < targetPageIndex; i++) {
      targetOffset += _getWidgetHeight(page[i]);
    }

    targetOffset -= 100;

    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/bg.webp',
          fit: BoxFit.cover,
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
        ),

        AnimatedOpacity(
          duration: Duration(milliseconds: 600),
          opacity: op ? 0.85 : 0.65,
          curve: Curves.easeInCubic,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            NavBar(onBarClick: onBarClick, buttonColor: buttonColor),
            SliverList(
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
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
                      child: TechStackCard(mbView: true,),
                    ),
                  );
                } else if (index >= 2 && index < 5) {
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
                } else if (index == 2 + 3) {
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
              }, childCount: page.length),
            ),
          ],
        ),
      ],
    );
  }
}

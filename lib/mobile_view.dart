import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components/about_me_card.dart';
import 'package:portfolio/components/edu_card.dart';
import 'package:portfolio/components/leetcode_card.dart';
import 'package:portfolio/components/project_box.dart';
import 'package:portfolio/components/tech_stack%20card.dart';
import 'package:portfolio/pages/first_page.dart';
import 'package:portfolio/pages/projects_page.dart';

class MobileView extends StatefulWidget {
  MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  late Color defaultColor;
  late Color selectedColor;
  int currentPage = 0;
  late List<Color> buttonColor;
  final ScrollController _scrollController = ScrollController();
  

  final _page = [
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
        summary: 'Videos, quizzes, and text-to-sign for learning sign language.',
        subSummary: 'Involved in this project\'s creation.',
        link: 'https://github.com/unknown7751/SignLanguageApp_Java',
        scale: 2,
      ),
    ),
  ];

  double _getWidgetHeight(Widget widget) {
    // You'll need to accurately estimate or calculate the height of each widget in _page.
    // This is a simplified example. For real production, consider GlobalKey or fixed heights.
    if (widget is FirstPage) return 600.0; // Estimate FirstPage height
    if (widget is Center && widget.child is SizedBox) {
      SizedBox sizedBox = widget.child as SizedBox;
      return sizedBox.height ?? 0.0; // Use SizedBox height if available
    }
    if (widget is ProjectsPage) return 800.0; // Estimate ProjectsPage height
    if (widget is SizedBox) return widget.height ?? 0.0;
    return 300.0; // Default estimate for other widgets
  }

  void onBarClick(int selectedButtonIndex) {
    setState(() {
      buttonColor[currentPage] = defaultColor;
      // We're mapping button clicks (0, 1, 2) to sections in _page.
      // 0: Home -> FirstPage (index 0 in _page)
      // 1: About -> Combined sections (TechStackCard, AboutMeCard, LeetCodeStats, EduCard) in _page
      // 2: Projects -> ProjectsPage (index 6 in _page)
      currentPage = selectedButtonIndex;
      buttonColor[currentPage] = selectedColor;
    });

    double targetOffset = 0.0;
    int targetPageIndex = 0; // The index in your _page list

    if (selectedButtonIndex == 0) {
      // Home
      targetPageIndex = 0; // FirstPage is at index 0
    } else if (selectedButtonIndex == 1) {
      // About
      // For 'About', you want to scroll to the beginning of the "About Me" section,
      // which starts after FirstPage and possibly other cards.
      // We need to sum the heights of the preceding widgets.
      // Assuming 'About' starts around TechStackCard.
      targetPageIndex = 2; // Start from TechStackCard
    } else if (selectedButtonIndex == 2) {
      // Projects
      targetPageIndex = 6; // ProjectsPage is at index 6
    }

    // Calculate the cumulative offset
    for (int i = 0; i < targetPageIndex; i++) {
      targetOffset += _getWidgetHeight(_page[i]);
    }

    // Add the expandedHeight of the SliverAppBar if you want to scroll just below it
    // You might need to adjust this based on how much of the app bar you want visible.
    targetOffset -=
        100; // Example adjustment to scroll slightly above the section for better visibility.

    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    defaultColor = Color.fromARGB(255, 131, 131, 131);
    selectedColor = Colors.white;
    buttonColor = [selectedColor, defaultColor, defaultColor];
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
                      .transparent, // Set to transparent so the blur is visible
              elevation: 0,
              pinned: true,
              floating: true,
              snap: true,
              expandedHeight: 120,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    // This Container will be the blurred background itself
                    ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5,
                          sigmaY: 5,
                        ), // Adjust for desired blur
                        child: Container(
                          color: Color.fromRGBO(
                            0,
                            0,
                            0,
                            0.5,
                          ), // Semi-transparent black for the blurred background
                        ),
                      ),
                    ),
                    // Your content (buttons in this case) on top of the blurred background
                    Align(
                      // Use Align to position the Row at the bottom center
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        // Add padding around the Row if desired
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
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return _page[index];
              }, childCount: _page.length),
            ),
          ],
        ),
      ],
    );
  }
}

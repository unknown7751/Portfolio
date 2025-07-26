import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components/About_section/about_me_card.dart';
import 'package:portfolio/components/About_section/edu_card.dart';
import 'package:portfolio/components/About_section/leetcode_card.dart';
import 'package:portfolio/components/Contact Section/contact_section.dart';
import 'package:portfolio/components/nav_bar.dart';
import 'package:portfolio/components/project_section/project_box.dart';
import 'package:portfolio/components/About_section/tech_stack card.dart';
import 'package:portfolio/pages/first_page.dart';

class DesktopView extends StatefulWidget {
  DesktopView({Key? key, required this.scrollController}) : super(key: key);
  final ScrollController scrollController;

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  late Color defaultColor;
  late Color selectedColor;
  int currentPage = 0;
  late List<Color> buttonColor;
  late ScrollController _scrollController;
  late Map<int, double> _sectionOffsets;
  bool op = false;

  List<Widget> projects = [
    ProjectBox(
      contWidth: 400,
      contheight: 340,
      imgWidth: 320,
      imgHeight: 180,
      img: 'assets/prjct11.webp',
      title: 'AI Flashcard App',
      summary: 'AI-powered Flutter app to create flashcards from text or documents—fast and easy.',
      subSummary: '',
      link: 'https://github.com/unknown7751/AIFlashcardApp',
      scale: 5,
    ),
    ProjectBox(
      contWidth: 400,
      contheight: 340,
      imgWidth: 320,
      imgHeight: 180,
      img: 'assets/prjct21.webp',
      title: 'SnipShare',
      summary: 'A code sharing web app',
      subSummary: 'played a role in this project\'s development.',
      link: 'https://github.com/Auxilus08/SnipShare',
      scale: 2,
    ),  
    ProjectBox(
      contWidth: 400,
      contheight: 340,
      imgWidth: 320,
      imgHeight: 180,
      img: 'assets/prjct31.webp',
      title: 'Sign Language App',
      summary: 'Videos, quizzes, and text-to-sign for learning sign language.',
      subSummary: 'Involved in this project\'s creation.',
      link: 'https://github.com/unknown7751/SignLanguageApp_Java',
      scale: 2,
    ),
  ];

  List<Widget> about = [
    SizedBox(width: 400, height: 250, child: TechStackCard()),
    SizedBox(width: 400, height: 250, child: AboutMeCard()),
    SizedBox(width: 400, height: 250, child: LeetCodeStats()),
    SizedBox(width: 400, height: 250, child: EduCard()),
  ];

  late final List<Widget> page = [
    FirstPage(),
    LayoutBuilder(builder: (context,constraints){
      double scrnW = MediaQuery.of(context).size.width;
      return _getLayout(scrnW, about);
    }),
    Padding(
      padding: const EdgeInsets.only(bottom: 18.0, top: 32.0),
      child: Text(
        'My Work',
        style: GoogleFonts.poppins(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    ),
    LayoutBuilder(builder: (context,constraints){
      double scrnW = MediaQuery.of(context).size.width;
      return _getLayout(scrnW, projects);
    }),
    SizedBox(height: 30),
    ContactSection(),
  ];

  Widget _getLayout(double scrnW,List<Widget> items){
    if(scrnW <= 833){
        return Column(spacing: 10,children: items,);
      }
      else {
        List<Row> rowsC =[];
        for(int i=0;i<items.length;i+=2){
          if(i+1 < items.length){
            rowsC.add(Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                items[i],SizedBox(width: 10,),items[i+1]
              ],
            ));
          }
          else{
            rowsC.add(Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                items[i]
              ],
            ));
          }
        }
        return Column(
          spacing: 10,
          children: rowsC,
        );
      }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController;
    defaultColor = const Color.fromARGB(255, 131, 131, 131);
    selectedColor = Colors.white;
    buttonColor = [selectedColor, defaultColor, defaultColor, defaultColor];
    _sectionOffsets = {};
    _calculateSectionOffsets();
    _scrollController.addListener(_scrollListener);
  }

  void _calculateSectionOffsets() {
    double currentOffset = 0.0;
    for (int i = 0; i < page.length; i++) {
      _sectionOffsets[i] = currentOffset;
      currentOffset += _getWidgetHeight(page[i]);
    }
    _sectionOffsets.updateAll((key, value) => value - 50);
  }

  double _getWidgetHeight(Widget widget) {
    if (widget is FirstPage) return 700.0;
    if (widget is Row) return 270.0;
    if (widget is Padding) return 100.0;
    if (widget is SizedBox) return widget.height ?? 0.0;
    if (widget is ContactSection) return 350.0;
    return 300.0;
  }

  void _scrollListener() {
  if (!_scrollController.hasClients || _sectionOffsets.isEmpty) return;

  double currentOffset = _scrollController.offset;
  int newCurrentPage = currentPage;

  // Use `??` to safely default to a large number if the key doesn't exist
  if (currentOffset >= (_sectionOffsets[6] ?? double.infinity)) {
    newCurrentPage = 3; // Contact
  } else if (currentOffset >= (_sectionOffsets[4] ?? double.infinity)) {
    newCurrentPage = 2; // Projects
  } else if (currentOffset >= (_sectionOffsets[1] ?? double.infinity)) {
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

  if (newCurrentPage != currentPage) {
    setState(() {
      buttonColor[currentPage] = defaultColor;
      currentPage = newCurrentPage;
      buttonColor[currentPage] = selectedColor;
    });
  }
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
      targetPageIndex = 0;
    } else if (selectedButtonIndex == 1) {
      targetPageIndex = 1;
    } else if (selectedButtonIndex == 2) {
      targetPageIndex = 3;
    } else if (selectedButtonIndex == 3) {
      targetPageIndex = 5;
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
          duration: const Duration(milliseconds: 600),
          opacity: op ? 0.85 : 0.65,
          curve: Curves.easeInCubic,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        Scrollbar(
          controller: _scrollController,
          thickness: 5,
          thumbVisibility: true, // <-- Ensures the scrollbar is always visible
          interactive: true, 
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            controller: _scrollController,
            slivers: [
              NavBar(onBarClick: onBarClick, buttonColor: buttonColor),
              SliverList(
                delegate: SliverChildBuilderDelegate((
                  BuildContext context,
                  int index,
                ) {
                  return page[index];
                }, childCount: page.length),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

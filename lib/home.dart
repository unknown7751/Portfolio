import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/first_page.dart';
import 'package:portfolio/mobile_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FadeInOnScroll extends StatefulWidget {
  const FadeInOnScroll({super.key});
  @override
  _FadeInOnScrollState createState() => _FadeInOnScrollState();
}

class _FadeInOnScrollState extends State<FadeInOnScroll> {
  late Color defaultColor;
  late Color selectedColor;
  int currentPage = 0;
  late List<Color> buttonColor;
  late PageController pageController; // Add this

  void onBarClick(int selectedPage) {
    setState(() {
      buttonColor[currentPage] = defaultColor;
      buttonColor[selectedPage] = selectedColor;
      currentPage = selectedPage;
    });
    pageController.animateToPage(
      selectedPage,
      duration: Duration(milliseconds: 600),
      curve: Curves.ease,
    ); // Change page
  }

  @override
  void initState() {
    super.initState();
    defaultColor = Color.fromARGB(255, 131, 131, 131);
    selectedColor = Colors.white;
    buttonColor = [selectedColor, defaultColor, defaultColor];
    pageController = PageController(initialPage: currentPage); // Initialize
    pageController.addListener(_pageListener);
  }

  void _pageListener() {
    int page = pageController.page!.round();
    if (page != currentPage && mounted) {
      setState(() {
        buttonColor[currentPage] = defaultColor;
        buttonColor[page] = selectedColor;
        currentPage = page;
      });
    }
  }

  @override
  void dispose() {
    pageController.removeListener(_pageListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.black,
        backgroundColor: Colors.black,
        elevation: 0,
        flexibleSpace: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      onBarClick(0);
                    },
                    child: Text(
                      'Home',
                      style: GoogleFonts.poppins(
                        color: buttonColor[0],
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 14),
                    child: TextButton(
                      onPressed: () {
                        onBarClick(1);
                      },
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
                    onPressed: () {
                      onBarClick(2);
                    },
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
        toolbarHeight: 120,
      ),
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
            return MobileView(
              currentPage: currentPage,
              pageController: pageController, // Pass controller
              onPageChanged: (page) {
                setState(() {
                  buttonColor[currentPage] = defaultColor;
                  buttonColor[page] = selectedColor;
                  currentPage = page;
                });
              },
            );
          } else {
            return Scaffold(body: Text('Desktop'));
          }
        },
      ),
    );
  }
}

// Align(
//           alignment: Alignment.topCenter,
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.black,
//             ),
//             height: 120,
//             child: 
//           ),
//         ),
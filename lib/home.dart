import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/first_page.dart';
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

  void onBarClick(int selectedPage) {
    setState(() {
      buttonColor[currentPage] = defaultColor;
      buttonColor[selectedPage] = selectedColor;
      currentPage = selectedPage;
    });
  }
  @override
  void initState() {
    super.initState();
    defaultColor = Color.fromARGB(255, 131, 131, 131);
    selectedColor = Colors.white;
    buttonColor= [selectedColor,defaultColor,defaultColor];
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
              return MobileView();
            } else {
              return Scaffold(body: Text('Desktop'));
            }
          },
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 70), // Adjust as needed
            width: MediaQuery.of(context).size.width * 0.7,
            padding: EdgeInsets.all(4),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {onBarClick(0);}, child: Text('Home',style: GoogleFonts.poppins(color: buttonColor[0],fontSize: 14),)),
                    Padding(
                      padding: const EdgeInsets.only(left : 14.0,right: 14),
                      child: TextButton(onPressed: () {onBarClick(1);}, child: Text('About',style: TextStyle(color: buttonColor[1],fontSize: 14),)),
                    ),
                    TextButton(onPressed: () {onBarClick(2);}, child: Text('Projects',style: TextStyle(color:buttonColor[2],fontSize: 14),)),
                  ],
                ),
                Container(height: 0.73,decoration: BoxDecoration(color: Color.fromARGB(255, 103, 103, 103)),)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

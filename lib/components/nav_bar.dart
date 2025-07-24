import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatefulWidget{
  Function onBarClick;
  List<Color> buttonColor;
  NavBar({super.key, required this.onBarClick, required this.buttonColor});
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late Function onBarClick;
  late List<Color> buttonColor;
  @override
  void initState() {
    super.initState();
    onBarClick = widget.onBarClick;
    buttonColor = widget.buttonColor;
  }
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
              toolbarHeight: 100,
              backgroundColor:
                  Colors
                      .transparent,
              elevation: 0,
              // pinned: true,
              floating: true,
              // snap: true,
              // expandedHeight: 120,
              title:Stack(
                  children: [
                    BackdropFilter(
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
                    Padding(
                      padding: const EdgeInsets.only(top : 50.0),
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
                          TextButton(
                            onPressed: () => onBarClick(3),
                            child: Text(
                              'Connect',
                              style: TextStyle(
                                color: buttonColor[3],
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ), 
            );
  }
}
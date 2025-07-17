import 'package:flutter/material.dart';
import 'package:portfolio/first_page.dart';
import 'package:portfolio/mobile_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FadeInOnScroll extends StatefulWidget {
  const FadeInOnScroll({super.key});
  @override
  _FadeInOnScrollState createState() => _FadeInOnScrollState();
}

class _FadeInOnScrollState extends State<FadeInOnScroll> {

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return MobileView();
        } 
        else {
          return Scaffold(
            body: Text('Desktop'),
          );
        }
      },
    );
  }
}



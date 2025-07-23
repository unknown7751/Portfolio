import 'package:flutter/material.dart';
import 'package:portfolio/mobile_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _FadeInOnScrollState createState() => _FadeInOnScrollState();
}

class _FadeInOnScrollState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
            return MobileView();
          } else {
            return Scaffold(body: Text('Desktop'));
          }
        },
      ),
    );
  }
}

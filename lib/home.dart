import 'package:flutter/material.dart';
import 'package:portfolio/desktop_view.dart';
import 'package:portfolio/mobile_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
            
            return MobileView(scrollController: scrollController,);
          } else {
            return DesktopView(scrollController: scrollController);
          }
        },
      ),
    );
  }
}

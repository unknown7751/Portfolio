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


// List<Row> rowsC =[];
//         for(int i=0;i<projects.length;i+=2){
//           if(i+1 < projects.length){
//             rowsC.add(Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 projects[i],projects[i+1]
//               ],
//             ));
//           }
//           else{
//             rowsC.add(Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 projects[i]
//               ],
//             ));
//           }
//         }
//         return Column(
//           children: rowsC,
//         );
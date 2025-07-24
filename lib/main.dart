import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
    
  }
}


// return Scaffold(
//       backgroundColor: Colors.black,
//       body: CustomScrollView(
//       controller: _scrollController,
//       slivers: [
//         SliverAppBar(
//           backgroundColor:
//               Colors
//                   .transparent,
//           elevation: 0,
//           pinned: true,
//           floating: true,
//           snap: true,
//           expandedHeight: 120,
//           flexibleSpace: FlexibleSpaceBar(
//             background: Stack(
//               children: [
//                 ClipRect(
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(
//                       sigmaX: 5,
//                       sigmaY: 5,
//                     ), 
//                     child: Container(
//                       color: Color.fromRGBO(
//                         0,
//                         0,
//                         0,
//                         0.5,
//                       ), 
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Padding(
//                     padding: const EdgeInsets.all(4.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         TextButton(
//                           onPressed: () => onBarClick(0),
//                           child: Text(
//                             'Home',
//                             style: GoogleFonts.poppins(
//                               color: buttonColor[0],
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             left: 14.0,
//                             right: 14,
//                           ),
//                           child: TextButton(
//                             onPressed: () => onBarClick(1),
//                             child: Text(
//                               'About',
//                               style: TextStyle(
//                                 color: buttonColor[1],
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () => onBarClick(2),
//                           child: Text(
//                             'Projects',
//                             style: TextStyle(
//                               color: buttonColor[2],
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () => onBarClick(3),
//                           child: Text(
//                             'Connect',
//                             style: TextStyle(
//                               color: buttonColor[3],
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SliverList(
//           delegate: SliverChildBuilderDelegate(
//             (BuildContext context, int index) {
//               // If index is 0, return FirstPage
//               if (index == 0) {
//                 return FirstPage();
//               }
//               // If index is 1, return TechStackCard
//               else if (index == 1) {
//                 return Center(
//                   child: SizedBox(
//                     width: 350,
//                     height: 200,
//                     child: TechStackCard(),
//                   ),
//                 );
//               }
//               else if (index >= 2 && index < 5) {
//                 final int page2Index = index;
//                 return VisibilityDetector(
//                   key: Key('item-$page2Index'),
//                   onVisibilityChanged: (info) {
//                     if (info.visibleFraction > 0.1 &&
//                         !_visible[page2Index - 2]) {
//                       setState(() {
//                         _visible[page2Index - 2] = true;
//                       });
//                     }
//                   },
//                   child: AnimatedOpacity(
//                     duration: Duration(milliseconds: 600),
//                     opacity: _visible[page2Index - 2] ? 1.0 : 0.0,
//                     child: page[page2Index],
//                   ),
//                 );
//               }
//               else if (index == 2 + 3) {
//                 return SizedBox(height: 30);
//               } else if (index == 2 + 3 + 1) {
//                 return Padding(
//                   padding: const EdgeInsets.only(bottom: 18.0),
//                   child: Text(
//                     'My Work',
//                     style: GoogleFonts.poppins(
//                       color: Colors.white,
//                       decoration: TextDecoration.none,
//                       fontSize: 27,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 );
//               }
//               return page[index]; // Fallback
//             },
//             childCount:
//                 page.length,
//           ),
//         ),
//       ],
//     ),
//     );
import 'package:flutter/material.dart';

class ProjectBox extends StatelessWidget{
  ProjectBox({
    super.key,
    required img,
    required title,
    required summary,
    required link,
    required langs,
  });

  String img = '';
  String title = '';
  String summary = '';
  String link = '';
  List<String> langs = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.2,color: Colors.white),
        color: Color(0xFF13162D),
        borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.only(top: 20),
      width: 355,
      height: 200,
      child: Column(
        children: [
          Container(width: 300,height: 179.3,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(width: 0.1,color: Colors.white)),child: Stack(children: [Image.asset('assets/prjctbg.png',)]))
        ],
      ),
    );
  }
}
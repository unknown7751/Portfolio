import 'dart:convert';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LeetCodeStats extends StatefulWidget {
  const LeetCodeStats({super.key});

  @override
  _LeetCodeStatsState createState() => _LeetCodeStatsState();
}

class _LeetCodeStatsState extends State<LeetCodeStats> {
  int totalSolved = 0;
  int easyCount = 0;
  int medCount = 0;
  int hardCount = 0;
  bool loading = true;

  final colorList = <Color>[
    Color.fromARGB(255, 163, 147, 253), // 🟦 Easy – Soft Blue (Blue-300)
    Color(0xFF6366F1), // 🔷 Medium – Soft Indigo (Indigo-500)
    Color(0xFF7C3AED), // 🔵 Hard – Deep Indigo (Indigo 900) // Rose Purple
  ];

  @override
  void initState() {
    super.initState();
    fetchLeetCodeStats();
  }

  Future<void> fetchLeetCodeStats() async {
  String url = 'https://leetcode-stats-api.herokuapp.com/aryan7751';

  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Fetch problem counts by difficulty
      final total = data['totalSolved'];
      int easy = data['easySolved'];
      int medium = data['mediumSolved'];
      int hard = data['hardSolved'];
      
      setState(() {
        totalSolved = total;
        easyCount = easy;
        medCount = medium;
        hardCount = hard;
        loading = false;
      });
    } else {
      print("Failed: ${response.statusCode}");
      setState(() {
        loading = false;
      });
    }
  } catch (e) {
    print("Error: $e");
    setState(() {
      loading = false;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(width: 0.2,color: Colors.white),
        color: const Color(0xFF101026),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    children: [
                      TextSpan(
                        text: 'unknown7751\n',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                      TextSpan(text: 'Leetcode\nSolved:\n'),
                      TextSpan(
                        text: '$totalSolved',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: colorList[0],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0, left: 60),
                  child:
                      loading
                          ? CircularProgressIndicator()
                          : SizedBox(
                            height: 130,
                            width: 130,
                            child: Stack(
                              children: [
                                PieChart(
                                  PieChartData(
                                    sections: [
                                      PieChartSectionData(
                                        value: easyCount.toDouble(),
                                        title: '$easyCount',
                                        titlePositionPercentageOffset: 3,
                                        titleStyle: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.white,
                                          decoration: TextDecoration.none,
                                        ),
                                        radius: 7,
                                        color: colorList[0],
                                      ),
                                      PieChartSectionData(
                                        value: medCount.toDouble(),
                                        radius: 7,
                                        title: '$medCount',
                                        titleStyle: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.white,
                                          decoration: TextDecoration.none,
                                        ),
                                        titlePositionPercentageOffset: 3,
                                        color: colorList[1],
                                      ),
                                      PieChartSectionData(
                                        value: hardCount.toDouble(),
                                        radius: 7,
                                        title: '$hardCount',
                                        titleStyle: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.white,
                                          decoration: TextDecoration.none,
                                        ),
                                        titlePositionPercentageOffset: 4,
                                        color: colorList[2],
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '$totalSolved',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      decoration: TextDecoration.none,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(width: 9, height: 9, color: colorList[0]),
                  ),
                  Text(
                    'Easy',
                    style: GoogleFonts.poppins(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(width: 9, height: 9),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(width: 9, height: 9, color: colorList[1]),
                  ),
                  Text(
                    'Medium',
                    style: GoogleFonts.poppins(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(width: 9, height: 9),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(width: 9, height: 9, color: colorList[2]),
                  ),
                  Text(
                    'hard',
                    style: GoogleFonts.poppins(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



    // Center(
    //   child: loading
    //       ? CircularProgressIndicator()
    //       : Text("Total Problems Solved: $totalSolved"),
    // );
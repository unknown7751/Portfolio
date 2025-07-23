import 'package:flutter/material.dart';
import 'dart:async'; // For Timer

class AutoScrollingTechList extends StatefulWidget {
  @override
  _AutoScrollingTechListState createState() => _AutoScrollingTechListState();
}

class _AutoScrollingTechListState extends State<AutoScrollingTechList> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  // Your list of strings
  final List<String> techs = [
    "Flutter",
    "Python",
    "Java",
    "SQL",
    "Javascript",
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) { // Scrolls every 3 seconds
      if (_pageController.hasClients) { // Ensure controller is attached to a PageView
        if (_currentPage < techs.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0; // Reset to the first page to loop
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 700), // Animation speed
          curve: Curves.easeOut, // Animation curve
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to prevent memory leaks
    _pageController.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
            controller: _pageController,
            itemCount: techs.length,
            itemBuilder: (context, index) {
              // Dynamically create a Text widget for each string
              return Container(
                color: Colors.primaries[index % Colors.primaries.length], // Assign different colors
                child: Center(
                  child: Text(
                    techs[index],
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          );
  }
}
import 'package:flutter/material.dart';
import 'package:portfolio/pages/first_page.dart';
import 'package:portfolio/pages/second_page.dart';
class MyPageView extends StatefulWidget {
  final int? cpage;
  final ValueChanged<int>? onPageChanged;
  final PageController pageController; // Add this

  MyPageView({
    super.key,
    required this.cpage,
    required this.pageController,
    this.onPageChanged,
  });

  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(_pageListener);
  }

  void _pageListener() {
    int page = widget.pageController.page?.round() ?? 0;
    if (mounted && page != _currentPage) {
      setState(() {
        _currentPage = page;
      });
      widget.onPageChanged?.call(page);
    }
  }

  @override
  void dispose() {
    widget.pageController.removeListener(_pageListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: widget.pageController,
      children: [
        FirstPage(),
        SecondPage(),
        // Add more pages as needed
      ],
    );
  }
}

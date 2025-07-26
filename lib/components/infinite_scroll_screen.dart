import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfiniteScroll extends StatefulWidget {
  List<String> items;
  InfiniteScroll({super.key, required this.items});

  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {
  late List<String> _items;

  @override
  void initState() {
    super.initState();
    _items = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final int itemIndex = index % _items.length;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF1B1B3A),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              _items[itemIndex],
              style: GoogleFonts.poppins(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}

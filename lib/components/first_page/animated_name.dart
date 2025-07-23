import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedName extends StatefulWidget {
  const AnimatedName({super.key});

  @override
  State<AnimatedName> createState() => _AnimatedNameState();
}

class _AnimatedNameState extends State<AnimatedName>
    with SingleTickerProviderStateMixin {
  late AnimatedTextController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimatedTextController();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          'Hi I\'m Aryan Jawanjal',
          textStyle: GoogleFonts.robotoCondensed(
            color: const Color.fromARGB(255, 131, 131, 131),
            fontSize: 20,
          ),
          speed: Duration(milliseconds: 120),
        ),
      ],
      totalRepeatCount: 1,
      pause: const Duration(milliseconds: 1000),
      // displayFullTextOnTap: true,
      stopPauseOnTap: true,
      controller: _controller,
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

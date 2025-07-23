import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeGithubButton extends StatefulWidget {
  const HomeGithubButton({super.key});

  @override
  State<HomeGithubButton> createState() => _HomeGithubButtonState();
}

class _HomeGithubButtonState extends State<HomeGithubButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  List<Color> cols = [Color.fromARGB(255, 163, 147, 253), Colors.white,Color.fromARGB(255, 163, 147, 253),];
  List<double> stps = [0.33,0.66,0.99];

  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://github.com/unknown7751');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder:
          (context, child) => Container(
            padding: EdgeInsets.all(0.05),
            width: 111,
            // height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                transform: GradientRotation(
                  2 * 3.14 * _animationController.value,
                ),
                stops: 
                [0.6, 1],
                colors:
                [Color.fromARGB(255, 114, 89, 255), Colors.white],
              ),
            ),
            child: child,
          ),
      child: Align(
        child: TextButton.icon(
          onPressed: _launchURL,
          icon: const FaIcon(FontAwesomeIcons.github, color: Colors.white),
          label: const Text('GitHub', style: TextStyle(color: Colors.white)),
          style: TextButton.styleFrom(
            fixedSize: const Size(110, 45),
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(
                color: Color.fromARGB(255, 103, 103, 103),
                width: 0.9,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

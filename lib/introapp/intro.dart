import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../question/question.dart';
import '../testhome.dart';
class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final _controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // page view
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 1);
            },
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/1.png"),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/2.png"),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            right: isLastPage ? 20 : -40,
            bottom: 30,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: GestureDetector(
                onTap: () async {
                  final SharedPreferences _prefs =
                      await SharedPreferences.getInstance();
                  _prefs.setBool('intro', true);
                  final showhome = _prefs.getBool('intro') ?? false;

//==============================================> HOME Page <===============================================//
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>showhome? HomePage():question()));
                },
                child: Icon(Icons.arrow_forward_ios, size: 50)),
          ),

          // dot indicators
          Container(
            alignment: Alignment(0, 0.9),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 2,
              effect: WormEffect(
                activeDotColor: Color.fromARGB(110, 104, 58, 183),
                dotColor: const Color.fromARGB(110, 209, 196, 233),
                dotHeight: 20,
                dotWidth: 20,
                spacing: 16,
                //verticalOffset: 50,,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

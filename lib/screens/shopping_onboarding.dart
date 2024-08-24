import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_cart/screens/intro_screens/intro_screen_2.dart';
import 'package:shopping_cart/screens/intro_screens/intro_screen_1.dart';
import 'package:shopping_cart/screens/intro_screens/intro_screen_3.dart';
import 'package:shopping_cart/screens/shopping_home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShoppingOnboard extends StatefulWidget {
  const ShoppingOnboard({super.key});

  @override
  State<ShoppingOnboard> createState() => _ShoppingOnboardState();
}

class _ShoppingOnboardState extends State<ShoppingOnboard> {
  PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                isLastPage = (value == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              SmoothPageIndicator(controller: _controller, count: 3,effect: const WormEffect(dotColor: Colors.white,activeDotColor: Colors.teal),),
              SizedBox(height: 20),
              isLastPage
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ShoppingHomePage()));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: const Center(
                              child: Text(
                            "Get Started",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: (){
                          _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: const Center(
                              child: Text(
                            "Continue",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    )
            ]),
          ),
        ],
      ),
    );
  }
}

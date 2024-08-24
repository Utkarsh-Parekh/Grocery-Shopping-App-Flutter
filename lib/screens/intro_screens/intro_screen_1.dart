import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.green.shade50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("lib/assets/grocery.png",scale: 8,),
              const Text(
                "Order with Zero Stress",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                "When you order from our app,You'll get your orders in few minutes,safe and easy way of shopping.",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

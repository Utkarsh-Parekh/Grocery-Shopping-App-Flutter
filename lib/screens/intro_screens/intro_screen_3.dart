import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green.shade50,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("lib/assets/secure_payment.png",scale: 8,),
              const Text(
                "Ease & Secure Payments",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Payment for your goods have never been easier,we offer a wide range of payment means that will soothe your convenience.",
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
import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

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
              Image.asset("lib/assets/delivery_man.png",scale: 8,),
              const Text(
                "Fast Delivery",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                "We operate our own logistics delivers ASAP and without compilications,just order and we bring the groceries to you.",
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
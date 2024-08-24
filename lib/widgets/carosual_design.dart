import 'package:flutter/material.dart';

class BannerDesign extends StatelessWidget {
  const BannerDesign({
    super.key,
    required this.bannerimagepath,
  });

  final String bannerimagepath;

  @override
  Widget build(BuildContext context) {

    final PageController pageController = PageController();

    return SizedBox(
      height: 200,
      child: PageView.builder(
          itemCount: 3,
          controller: pageController,
          itemBuilder: (_, index) {
            return AnimatedBuilder(
                animation: pageController,
                builder: (context, child) {
                  return child!;
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.green.shade200,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(bannerimagepath),
                      ),
                    ),
                  ),
                ));
          }),
    );
  }
}

import 'package:flutter/material.dart';

class ItemsHorizontal extends StatelessWidget {
  final String imagePath;
  final String categoriesName;

  ItemsHorizontal({
    super.key,
    required this.imagePath,
    required this.categoriesName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.shade50,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(imagePath))),
          ),
          const SizedBox(height: 10,),
          Text(categoriesName,style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}

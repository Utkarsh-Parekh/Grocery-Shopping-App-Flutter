import 'package:flutter/material.dart';

class ItemProvider extends ChangeNotifier{


   final List _popularItems = [
    ["Apple","80",   "lib/assets/apple.png"],
    ["LadiesFinger", "24","lib/assets/ladiesfinger.png"],
    ["Banana", "25","lib/assets/banana.png"],
    ["Potato", "46","lib/assets/potato.png"],
    ["Tomato","32",   "lib/assets/tomato.png"],
    ["Cabbage", "34","lib/assets/cabbage.png"],
  ];

  final List _cartItems = [];

  get popularItems => _popularItems;
  get cartItems => _cartItems;


  void addtoCartItem(int index){
    _cartItems.add(_popularItems[index]);
    notifyListeners();
  }


  void removetoCartItem(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String CalculateTotal(){
    double totalPrice = 0;
    for(int i =0;i < _cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toString();
  }

}
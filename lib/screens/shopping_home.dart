import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopping_cart/model/categories_model.dart';
import 'package:shopping_cart/screens/cart_page.dart';
import 'package:shopping_cart/widgets/grid_layout.dart';
import 'package:shopping_cart/widgets/items_horizonatal.dart';

class ShoppingHomePage extends StatelessWidget {
  const ShoppingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return CartPage();
            }),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Utkarsh",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "B-32,Avran Bunglows,Godhra",
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(30), // Image radius
                child: Image.asset('lib/assets/person_avatar.png',
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),

      //Search Bar

      body: PopScope(
        canPop: false,
        onPopInvoked: ((didpop){
          if(didpop){
            return;
          }
          else{
            showAlertDialogBox(context);
          }
        }),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.grey.shade500,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Search Groceries",
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.tune,
                        color: Colors.teal,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "View more >",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                       ),
                    child: Center(
                      child: ListView.builder(
                        itemCount: categoriesList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final _categories = categoriesList[index];
                          return ItemsHorizontal(
                              imagePath: _categories.imagePath!,
                              categoriesName: _categories.categoriesName!);
                        },
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Popular Items",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Expanded(child: GridLayout())
            ],
          ),
        ),
      ),
    );
  }
}


showAlertDialogBox(BuildContext context){
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.green.shade300,
    title: Text("Confirmation"),
    content: Text("Would you like to close the App?",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
    actions: [
      Container(
       decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)
                        ),
        child: TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text("No",style: TextStyle(fontSize: 16,color: Colors.white),)),
      ),
      Container(
         decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)
                        ),
        child: TextButton(onPressed: (){
          exit(0);
        }, child: Text("Yes",style: TextStyle(fontSize: 16,color: Colors.white),)),
      )
    ],
  );


  showDialog(
    context: context,
    builder: (BuildContext context){
      return alert;
    }
  );

}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/provider/item_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<ItemProvider>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                Text("My Cart",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.green.shade300),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Image.asset(value.cartItems[index][2]),
                            title: Text(
                              value.cartItems[index][0],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              " ₹" + value.cartItems[index][1],
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black54),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  Provider.of<ItemProvider>(context,
                                          listen: false)
                                      .removetoCartItem(index);
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            
            
                value.cartItems.length > 0 ?
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.green.shade400),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Total Amount",style: TextStyle(color: Colors.white,fontSize: 16),),
                          Text(" ₹ ${value.CalculateTotal()}",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
                        ],
                      ),
            
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)
                        ),
                        padding: EdgeInsets.all(16),
                        child: const Text("Pay Now",style: TextStyle(fontSize: 16,color: Colors.white),))
                      ]
                    ),
                  ),
                ) : Container()
              ],
            ),
          );
        },
      ),
    );
  }
}

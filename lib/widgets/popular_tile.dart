import 'package:flutter/material.dart';

class PopularTile extends StatelessWidget {

  final String ItemName;
  final String Price;
  final String imageName;
  final Function()? onTap;


  const PopularTile({super.key, 
  required this.ItemName, 
  required this.Price, 
  required this.imageName,
  required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: Container(
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.green.shade100  ,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),topLeft: Radius.circular(16)),
                    color: Colors.green.shade300
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(Price + " ₹",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,),
              child: Image.asset(imageName, fit: BoxFit.cover,),
            ),

            Text(ItemName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

           
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                     Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.shade300
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: onTap,
                      child: const Icon(Icons.add)),
                  ),
                )
                
                  ],
                )
               
                
             
           
          ],
        ),
      ),
    );
  }
}
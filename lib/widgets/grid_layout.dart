import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/provider/item_provider.dart';
import 'package:shopping_cart/widgets/popular_tile.dart';

class GridLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemProvider>(
      builder: (context, value, child) {
        return GridView.builder(
          itemCount: value.popularItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1 / 1.6),
          itemBuilder: (context, index) {
            return PopularTile(
                ItemName: value.popularItems[index][0],
                Price: value.popularItems[index][1],
                imageName: value.popularItems[index][2],
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "${value.popularItems[index][0]} is added Successfully"),
                          behavior: SnackBarBehavior.floating,
                    ),
                  );
                  Provider.of<ItemProvider>(context, listen: false)
                      .addtoCartItem(index);
                });
          },
        );
      },
    );
  }
}

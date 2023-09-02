import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart provider.dart';
import '../widgets/main_title.dart';
import '../widgets/product items.dart';
import 'cart.dart';


class FishItemScreen extends StatelessWidget {
  const FishItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


  @override
  Widget build(BuildContext context) {
    final fishItems = context.watch<CartProvider>().fishh;
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MainTitle(title: "Fish"),
            Expanded(
              child: GridView.builder(
                  itemCount: fishItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.4),
                  itemBuilder: (context, index) => ProductItemCard(
                    title: fishItems[index].name,
                    price: fishItems[index].price.toString(),
                    imageUrl: fishItems[index].image,
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .addToCart(fishItems[index]);
                    },
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CartScreen();
          },
        )),
        child:const Wrap(children: [
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),

        ]),
      ),
    );
  }

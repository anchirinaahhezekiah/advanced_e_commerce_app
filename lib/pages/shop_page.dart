import 'package:advanced_e_commerce_app/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_product_tile.dart';
import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Shop Page'),
          centerTitle: true,
          actions: [
            //go to cart button
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: const Icon(Icons.add_shopping_cart_outlined))
          ],
        ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            //shop subtitle
            Center(
              child: Text(
                'Pick from a selected list of premium products',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),

            //product list
            SizedBox(
              height: 550,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  //get each product from the shop
                  final product = products[index];

                  //return as a product tile ui
                  return MyProductTile(product: product);
                },
              ),
            ),
          ],
        ));
  }
}

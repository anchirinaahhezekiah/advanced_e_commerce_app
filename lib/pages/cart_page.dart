import 'package:advanced_e_commerce_app/components/my_button.dart';
import 'package:advanced_e_commerce_app/models/product.dart';
import 'package:advanced_e_commerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from cart
  void removeItemFromCart(BuildContext context, Product product) {
    //show dialog box to ask user t confirm to remove item
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Remove this item from cart?'),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),

          //yes button
          MaterialButton(
            onPressed: () {
              //pop dialog box
              Navigator.pop(context);

              //add to cart
              context.read<Shop>().removeCartItem(product);
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }

  //user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text(
          'User want to pay! Connect this app to your payment backend',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get access to cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart Page'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text('Your cart is empty...'))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get individual item in cart
                      final item = cart[index];

                      //return as a cart tile UI
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                            onPressed: () => removeItemFromCart(context, item),
                            icon: const Icon(Icons.remove)),
                      );
                    },
                  ),
          ),

          //pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context),
                child: const Text('PAY NOW')),
          )
        ],
      ),
    );
  }
}

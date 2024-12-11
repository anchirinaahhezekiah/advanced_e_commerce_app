import 'package:advanced_e_commerce_app/models/product.dart';
import 'package:flutter/cupertino.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    Product(
      name: 'Glasses',
      price: 99.99,
      description: 'Item Description',
      imagePath: 'assets/glasses.png',
    ),
    Product(
      name: 'Sneakers',
      price: 19.99,
      description: 'Item Description',
      imagePath: 'assets/sneaker.png',
    ),
    Product(
      name: 'Sweat shirt',
      price: 49.99,
      description: 'Item Description',
      imagePath: 'assets/sweatshirt.png',
    ),
    Product(
      name: 'Watch',
      price: 59.99,
      description: 'Item Description',
      imagePath: 'assets/watch.png',
    )
  ];

  //user cart
  List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeCartItem(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:sushi_ui/model/prouduct_model.dart';

class Cart extends ChangeNotifier {
  //null list to store products
  final List<Products> _cartProducts = [];
  //get cartProduct
  List<Products> get cartProducts => _cartProducts;
  //add products to cart
  void addToCart(Products products) {
    _cartProducts.add(products);
    notifyListeners();
  }

  //remove products from cart
  void removeToCart(Products products) {
    _cartProducts.remove(products);
    notifyListeners();
  }

  //calculat price
  double totalPrice() {
    double total = 0;
    for (int i = 0; i < cartProducts.length; i++) {
      total += cartProducts[i].price;
    }
    notifyListeners();
    return total;
  }
}

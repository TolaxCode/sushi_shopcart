import 'package:flutter/material.dart';
import 'package:sushi_ui/model/prouduct_model.dart';

class Cart extends ChangeNotifier {
  //null list to store products
  final List<Products> _cartProducts = [];
  //get cartProduct
  List<Products> get cartProducts => _cartProducts;
  //add products to cart
  void addToCart(Products products, int qty) {
    _cartProducts.add(products);
    notifyListeners();
  }

  dynamic qty = 1;
  //remove products from cart
  void removeToCart(Products products) {
    for (int i = 0; i < qty; i++) {
      _cartProducts.remove(products);
    }

    notifyListeners();
  }

  //calculat price
  totalPrice() {
    double total = 0;
    for (int i = 0; i < cartProducts.length; i++) {
      total += cartProducts[i].price;
    }
    notifyListeners();
    return total;
  }
}

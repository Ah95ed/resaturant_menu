import 'package:flutter/material.dart';
import 'package:restaurant_management/Models/CartModels.dart';

class CartController with ChangeNotifier {
  List<Cartmodels> carts = [

  ];

  void addToCart(Cartmodels product) {
    carts.add(product);
    notifyListeners();
  }



  void removeFromCart(int index) {
    carts.removeAt(index);
    notifyListeners();
  }
  double getAllPriceCart(){

    double total = 0.0;
    for (int i = 0; i < carts.length; i++) {
      total += carts[i].price * carts[i].quantity;
    }
    return total;
  }
}

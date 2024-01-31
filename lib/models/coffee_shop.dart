import 'dart:ffi';

import 'package:coffee_shop_app/models/coffee.dart';
import 'package:flutter/material.dart';

//what ChangeNotifier does is if there is any changers in your app like if user add or remove items from the cart
//we wanna reflect the state of the app which need to notify the listener
class CoffeShop extends ChangeNotifier {
  //coffee menu list
  final List<Coffee> _coffeeList = [
    //black coffee
    Coffee(name: "Black Coffee", price: "5.90", imagePath: 'assets/black.png'),
    //ice coffee
    Coffee(
        name: "Ice Coffee", price: "6.50", imagePath: 'assets/iced-coffee.png'),
    //ice tea
    Coffee(name: "Ice Tea", price: "4.50", imagePath: 'assets/iced-tea.png'),
    //espresso
    Coffee(name: "Espresso", price: "6.00", imagePath: 'assets/espresso.png')
  ];

  //user cart
  List<Coffee> _userCart = [];

  //get coffee list
  List<Coffee> get coffeeShop => _coffeeList;

  //get user cart
  List<Coffee> get userCart => _userCart;
  //add items to cart
  void addItemToCart(Coffee _coffee) {
    _userCart.add(_coffee);
    notifyListeners();
  }

  //remove items from cart
  void removeItemFromCart(Coffee _coffee) {
    _userCart.remove(_coffee);
    notifyListeners();
  }
}

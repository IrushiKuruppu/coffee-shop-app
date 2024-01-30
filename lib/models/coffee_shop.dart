import 'dart:ffi';

import 'package:coffee_shop_app/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeShop {
  //coffee menu list
  final List<Coffee> _coffeeList = [
    //black coffee
    Coffee(
        name: "Black Coffee", price: "5.90", imagePath: 'lib/assets/black.png'),
    //ice coffee
    Coffee(
        name: "Ice Coffee",
        price: "6.50",
        imagePath: 'lib/assets/iced-coffee.png'),
    //ice tea
    Coffee(
        name: "Ice Tea", price: "4.50", imagePath: 'lib/assets/iced-tea.png'),
    //espresso
    Coffee(
        name: "Espresso", price: "6.00", imagePath: 'lib/assets/espresso.png')
  ];

  //user cart
  List<Coffee> _userCart = [];

  //get coffee list
  List<Coffee> get _coffeeshop => _coffeeList;

  //get user cart
  List<Coffee> get userCart => _userCart;
  //add items to cart
  void addItemToCart(Coffee _coffee) {
    _userCart.add(_coffee);
  }

  //remove items from cart
  void removeItemFromCart(Coffee _coffee) {
    _userCart.remove(_coffee);
  }
}

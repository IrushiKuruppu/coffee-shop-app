import 'package:coffee_shop_app/components/bottom_navbar.dart';
import 'package:coffee_shop_app/const.dart';
import 'package:coffee_shop_app/pages/shop_page.dart';
import 'package:coffee_shop_app/pages/cart_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //navigate to the page
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //display the proper page
  final List<Widget> _pages = [
    //shop page
    ShopPage(),
    //cart page
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

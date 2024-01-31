import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/coffee_tile.dart';
import '../models/coffee.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void deleteFromCart(Coffee coffee) {
    Provider.of<CoffeShop>(context, listen: false).removeItemFromCart(coffee);
    //success alert to notify user
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Item successfully deleted to the cart !"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //heading
              const Text(
                "Your Cart Page",
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(
                height: 25,
              ),
              //coffee tile
              Expanded(
                child: ListView.builder(
                    itemCount: value.userCart.length,
                    itemBuilder: (context, index) {
                      //get individual coffee
                      Coffee eachCoffee = value.userCart[index];
                      //return tile for each coffee
                      return CoffeeTile(
                        coffee: eachCoffee,
                        icon: const Icon(Icons.delete),
                        onPressed: () => deleteFromCart(eachCoffee),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

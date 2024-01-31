import 'package:coffee_shop_app/components/coffee_tile.dart';
import 'package:coffee_shop_app/models/coffee.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add to the cart
  void addCart(Coffee coffee) {
    //adding item to cart
    Provider.of<CoffeShop>(context, listen: false).addItemToCart(coffee);
    //success alert to notify user
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Item successfully added to the cart !"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    //consumer widget helps to sonsume the data
    return Consumer<CoffeShop>(
      builder: (context, value, child) => SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //heading
            const Text(
              "How do you like your coffee ?",
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(
              height: 25,
            ),

            //list of coffees
            Expanded(
              child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    //get individual coffee
                    Coffee eachCoffee = value.coffeeShop[index];
                    //return tile for each coffee
                    return CoffeeTile(
                      coffee: eachCoffee,
                      icon: const Icon(Icons.add),
                      onPressed: () => addCart(eachCoffee),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}

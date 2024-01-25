// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:pizzahootapp/components/button.dart';
import 'package:pizzahootapp/models/food.dart';
import 'package:pizzahootapp/models/shop.dart';
import 'package:pizzahootapp/theme/colors.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove from Cart
  void removeFromCart(Food food, BuildContext context) {
    // get access to shop
    final shop = context.read();

    // remove from cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: bodyBackgroundColor,
        appBar: AppBar(
          title: Text('My Cart'),
          elevation: 0,
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            // Customer Cart
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // get food from cart
                  final Food food = value.cart[index];

                  // get food name
                  final String foodName = food.name;

                  // get food price
                  final String foodPrice = food.price;

                  // return list title
                  return Container(
                    decoration: BoxDecoration(
                      color: bodyTextColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: EdgeInsets.only(
                      left: 16,
                      top: 20,
                      right: 16,
                    ),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        foodPrice,
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => removeFromCart(food, context),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Pay Button
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: 'Pay Now',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

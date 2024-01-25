import 'package:flutter/material.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  // food menu
  final List<Food> _foodMenu = [
    // classic cheeseburger
    Food(
      name: 'Classic Cheeseburger',
      price: '\$21.00',
      imagePath: 'images/pizza_04.png',
      rating: '4.5',
    ),

    // Paprika Crispy
    Food(
      name: 'Paprika Crispy',
      price: '\$21.00',
      imagePath: 'images/pizza_05.png',
      rating: '4.5',
    ),

    // Tomato Avocade
    Food(
      name: 'Tomato Avocade',
      price: '\$21.00',
      imagePath: 'images/pizza_06.png',
      rating: '4.5',
    ),
  ];

  // customer cart
  List<Food> _cart = [];

  // getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:pizzahootapp/models/shop.dart';
import 'package:pizzahootapp/pages/cart_page.dart';
import 'package:pizzahootapp/pages/intro_page.dart';
import 'package:pizzahootapp/pages/menu_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => Shop(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intropage': (context) => IntroPage(),
        '/menupage': (context) => MenuPage(),
        '/cartpage': (context) => CartPage(),
      },
    );
  }
}

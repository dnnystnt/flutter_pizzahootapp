import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizzahootapp/components/button.dart';
import 'package:pizzahootapp/components/food_tile.dart';
// import 'package:pizzahootapp/models/food.dart';
import 'package:pizzahootapp/models/shop.dart';
import 'package:pizzahootapp/pages/food_detail_page.dart';
import 'package:pizzahootapp/theme/colors.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // navigate to food item detail page
  void navigateToFoodDetails(int index) {
    // get the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Color(0xffF7F9FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: bodyTextColor,
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 100,
          ),
          child: Text(
            'Pizzahoot',
            style: TextStyle(color: bodyTextColor, fontSize: 14),
          ),
        ),
        actions: [
          // cart button
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // promo banner
          Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // promo message
                    Text(
                      'Get 32% Discount',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: bodyTextColor,
                      ),
                    ),

                    SizedBox(height: 60),

                    // get it now button
                    MyButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 6,
                      ),
                      text: 'Get It Now',
                      onTap: () {},
                    ),
                  ],
                ),
                Image.asset(
                  'images/pizza_01.png',
                  height: 160,
                  width: 160,
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: greyYoungColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: greyYoungColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: greyYoungColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Search Here...',
              ),
            ),
          ),

          SizedBox(height: 32),

          // menu list
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              'Pizza List',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: bodyTextColor,
              ),
            ),
          ),

          SizedBox(height: 2),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
              ),
            ),
          ),

          SizedBox(height: 32),

          // other pizza menu
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 20,
              top: 20,
            ),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // image
                    Image.asset(
                      'images/pizza_02.png',
                      height: 40,
                    ),

                    SizedBox(width: 20),

                    // name & price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name
                        Text(
                          'Cheese Pizza',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                          ),
                        ),

                        SizedBox(height: 8),

                        // price
                        Text(
                          '\$21.00',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // heart
                Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

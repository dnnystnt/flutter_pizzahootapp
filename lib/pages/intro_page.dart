import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizzahootapp/components/button.dart';
import 'package:pizzahootapp/theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F9FF),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 25),
            // shop name
            Text(
              'PIZZAHOOT',
              style: GoogleFonts.inter(
                fontSize: 28,
                color: Color(0xff28293D),
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 25),

            // icon
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('images/pizza_01.png'),
            ),

            SizedBox(height: 25),

            // title
            Text(
              'The Taste of Pizza',
              style: GoogleFonts.inter(
                fontSize: 20,
                color: Color(0xff28293D),
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 4),

            // subtitle
            Text(
              'Feel the taste of the pizza which is most popular Italian food from anywhere and anytme',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: bodyDescTextColor,
                fontWeight: FontWeight.w400,
                height: 2,
              ),
            ),

            SizedBox(height: 20),

            // get started button
            MyButton(
              padding: EdgeInsets.symmetric(
                horizontal: 100,
                vertical: 18,
              ),
              text: 'Get Started',
              onTap: () {
                // go to menu page
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}

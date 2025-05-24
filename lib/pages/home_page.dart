import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/offer_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 250,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              const Icon(Icons.electric_bike_rounded, color: Colors.black),
              const SizedBox(width: 10),
              Text(
                '61 Hopper Street',
                style: GoogleFonts.inter(fontSize: 16, color: Colors.black),
              ),
              const Icon(Icons.arrow_drop_down, color: Colors.black),
            ],
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.shopping_basket_outlined, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                OfferCard(
                  bgColor: Color(0xFFD7FFD4),
                  imagePath: 'assets/images/1.png',
                  titleColor: Colors.black,
                  subtitleColor: Color(0xFF0CA201),
                  buttonColor: Color(0xFF0CA201),
                  buttonTextColor: Colors.white,
                  title: 'Up to 50% off',
                  subtitle: 'Enjoy our big offers',
                ),
                OfferCard(
                  bgColor: Color(0xFF0CA201),
                  imagePath: 'assets/images/2.png',
                  titleColor: Colors.white,
                  subtitleColor: Color(0xFF0CA201),
                  buttonColor: Color(0xFF0CA201),
                  buttonTextColor: Colors.white,
                  title: 'Up to 50% off',
                  subtitle: 'Enjoy our big offers',
                ),
                OfferCard(
                  bgColor: Color(0xFFD7FFD4),
                  imagePath: 'assets/images/3.png',
                  titleColor: Colors.black,
                  subtitleColor: Color(0xFF0CA201),
                  buttonColor: Color(0xFF0CA201),
                  buttonTextColor: Colors.white,
                  title: 'Up to 50% off',
                  subtitle: 'Enjoy our big offers',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

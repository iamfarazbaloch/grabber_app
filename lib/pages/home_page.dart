import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.shopping_basket_outlined, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.all(40),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFFD7FFD4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      'Up to 50% off',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Enjoy our big offers',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Color(0xFF0CA201),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 12,
                        left: 20,
                        right: 20,
                        bottom: 12,
                      ),
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFF0CA201),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Shop Now',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Image.asset('assets/images/2.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OfferCard extends StatelessWidget {
  final Color bgColor;
  final String imagePath;
  final Color titleColor;
  final Color subtitleColor;
  final Color buttonColor;
  final Color buttonTextColor;
  final String title;
  final String subtitle;
  const OfferCard({
    super.key,
    required this.bgColor,
    required this.imagePath,
    required this.titleColor,
    required this.subtitleColor,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Text Column
          SizedBox(
            width: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: subtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Shop Now',
                    style: GoogleFonts.inter(
                      color: buttonTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Image
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, size: 50, color: Colors.red);
              },
            ),
          ),
        ],
      ),
    );
  }
}

//light green Color(0xFFD7FFD4)
//green const Color(0xFF0CA201)
//yellow const Color(0xFFFFDB24)

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabber_app/model/products_model.dart';
import '../providers/products_provider.dart';
import '../widgets/offer_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

// Categories
Map<String, dynamic> data = {
  'assets/icons/fruits.png': 'Fruits',
  'assets/icons/milk.png': 'Milk & Eggs',
  'assets/icons/drink.png': 'Beverages',
  'assets/icons/laundry.png': 'Laundry',
  'assets/icons/veg.png': 'Vegetables',
};

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productListProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.19,
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
        spacing: 20,
        children: [
          const SizedBox(),
          const CustomCard(),
          const CategoryItem(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fruits',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See all',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Color(0xFF0CA201),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ProductItem(products: products),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.products});

  final List<ProductsModel> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 14.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        Image.asset(product.image, fit: BoxFit.contain),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product.title,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow.shade700),
                      Text(
                        product.rating,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        product.reviews,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '\$${product.price}',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          String imagePath = data.keys.toList()[index];
          String label = data.values.toList()[index];
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 4),
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(imagePath, fit: BoxFit.contain),
                ),
                const SizedBox(height: 6),
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            title: 'Up to 30% off',
            subtitle: 'Enjoy our big offers',
          ),
          OfferCard(
            bgColor: Color(0xFF0CA201),
            imagePath: 'assets/images/3.png',
            titleColor: Colors.white,
            subtitleColor: Colors.white54,
            buttonColor: Colors.white,
            buttonTextColor: Colors.black,
            title: 'Up to 25% off',
            subtitle: 'On first buyer',
          ),
          OfferCard(
            bgColor: Color(0xFFFFDB24),
            imagePath: 'assets/images/2.png',
            titleColor: Colors.black,
            subtitleColor: Colors.black,
            buttonColor: Colors.white,
            buttonTextColor: Colors.black,
            title: 'Fast delivery',
            subtitle: 'Orders over \$50',
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

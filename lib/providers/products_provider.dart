import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/products_model.dart';

final productListProvider = Provider<List<ProductsModel>>((ref) {
  return [
    ProductsModel(
      image: 'assets/images/banana.png',
      title: 'Banana',
      rating: '4.5',
      reviews: '(100)',
      price: '4.99',
    ),
    ProductsModel(
      image: 'assets/images/chilie.png',
      title: 'Chilie',
      rating: '4.2',
      reviews: '(120)',
      price: '2.99',
    ),
    ProductsModel(
      image: 'assets/images/orange.png',
      title: 'Orange',
      rating: '4.9',
      reviews: '(200)',
      price: '5.99',
    ),
  ];
});

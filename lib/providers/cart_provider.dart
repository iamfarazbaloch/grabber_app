import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/products_model.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<ProductsModel>>((
  ref,
) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<ProductsModel>> {
  CartNotifier() : super([]);

  void addToCart(ProductsModel product) {
    final index = state.indexWhere((item) => item.title == product.title);
    if (index == -1) {
      state = [...state, product];
    } else {
      final existing = state[index];
      final updatedItem = ProductsModel(
        image: existing.image,
        title: existing.title,
        rating: existing.rating,
        reviews: existing.reviews,
        price: existing.price,
        quantity: existing.quantity + 1,
      );
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index) updatedItem else state[i],
      ];
    }
  }

  void removeFromCart(ProductsModel product) {
    state = state.where((item) => item.title != product.title).toList();
  }

  void increaseQuantity(ProductsModel product) {
    state = state.map((item) {
      if (item.title == product.title) {
        return ProductsModel(
          image: item.image,
          title: item.title,
          rating: item.rating,
          reviews: item.reviews,
          price: item.price,
          quantity: item.quantity + 1,
        );
      }
      return item;
    }).toList();
  }

  void decreaseQuantity(ProductsModel product) {
    state = state.map((item) {
      if (item.title == product.title && item.quantity > 1) {
        return ProductsModel(
          image: item.image,
          title: item.title,
          rating: item.rating,
          reviews: item.reviews,
          price: item.price,
          quantity: item.quantity - 1,
        );
      }
      return item;
    }).toList();
  }

  void clearCart() {
    state = [];
  }

  double get totalPrice {
    return state.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }
}

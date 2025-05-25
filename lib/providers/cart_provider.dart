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
    if (!state.contains(product)) {
      state = [...state, product];
    }
  }

  void removeFromCart(ProductsModel product) {
    state = state.where((item) => item != product).toList();
  }

  void clearCart() {
    state = [];
  }
}

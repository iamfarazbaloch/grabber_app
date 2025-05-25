class ProductsModel {
  final String image;
  final String title;
  final String rating;
  final String reviews;
  final double price;
  int quantity;

  ProductsModel({
    required this.image,
    required this.title,
    required this.rating,
    required this.reviews,
    required this.price,
    this.quantity = 1,
  });
}

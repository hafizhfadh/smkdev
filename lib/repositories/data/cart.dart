class CartData {
  String cover;
  String title;
  String ingredient;
  int price;
  int order;

  CartData({
    required this.cover,
    required this.title,
    required this.ingredient,
    required this.price,
    this.order = 0,
  });

}
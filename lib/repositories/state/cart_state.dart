import 'dart:math';

import 'package:smkdev/repositories/data/cart.dart';

List<CartData> generateCartDataList(int numberOfItems) {
  List<String> covers = [
    'cover1.jpg',
    'cover2.jpg',
    'cover3.jpg',
    // Add more cover image names as needed
  ];

  List<String> titles = [
    'Item A',
    'Item B',
    'Item C',
    // Add more item titles as needed
  ];

  List<String> ingredients = [
    'Ingredient X, Ingredient Y',
    'Ingredient Z, Ingredient W',
    'Ingredient P, Ingredient Q',
    // Add more ingredient lists as needed
  ];

  Random random = Random();

  List<CartData> cartDataList = List.generate(numberOfItems, (index) {
    return CartData(
      cover: covers[random.nextInt(covers.length)],
      title: titles[random.nextInt(titles.length)],
      ingredient: ingredients[random.nextInt(ingredients.length)],
      price: random.nextInt(50) + 10, // Random price between 10 and 60
      order: random.nextInt(5), // Random order quantity between 0 and 4
    );
  });

  return cartDataList;
}
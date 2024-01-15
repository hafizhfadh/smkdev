import 'package:flutter/material.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            hintText: "Find Foods, Drink, Snack...",
            prefixIcon: Icon(Icons.search)
        ),
      ),
    );
  }
}

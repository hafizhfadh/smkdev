import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smkdev/utils/food_icon_icons.dart';

class FoodAppBar extends StatelessWidget {
  const FoodAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton.outlined(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          const Text(
            "Detail Merchant",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton.outlined(
                    onPressed: () {},
                    icon: const Icon(
                      FoodIcon.thumbs_up,
                      size: 16,
                    )),
                IconButton.outlined(
                  onPressed: () {},
                  icon: const Icon(
                    FoodIcon.history,
                    size: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

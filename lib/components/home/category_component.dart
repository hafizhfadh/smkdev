import 'package:flutter/material.dart';

class CategoryComponent extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;

  const CategoryComponent({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15)),
            height: MediaQuery.sizeOf(context).height / 14,
            width: MediaQuery.sizeOf(context).width / 4,
            child: Icon(
              icon,
              color: color,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18
            ),
          )
        ],
      ),
    );
  }
}

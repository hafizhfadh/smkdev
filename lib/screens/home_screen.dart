import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smkdev/components/home/category_component.dart';
import 'package:smkdev/components/home/search_component.dart';
import 'package:smkdev/components/home/user_profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _category = [
    {
      'title': "Voucher",
      'icon': Icons.discount,
      'color': Colors.orangeAccent,
    },
    {
      'title': "Dessert",
      'icon': Icons.icecream,
      'color': Colors.blueAccent,
    },
    {
      'title': "Fast Food",
      'icon': Icons.rice_bowl,
      'color': Colors.yellowAccent,
    },
    {
      'title': "Diet Food",
      'icon': Icons.grass,
      'color': Colors.greenAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            UserProfile(),
            SearchComponent(),
            CarouselSlider(
              options: CarouselOptions(
                  height: MediaQuery.sizeOf(context).height / 8),
              items: [1, 2, 3, 4].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.amber),
                        child: Image.network("https://picsum.photos/800/400"));
                  },
                );
              }).toList(),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height / 6,
              child: ListView.builder(
                  itemCount: _category.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> category = _category[index];
                    return CategoryComponent(
                        color: category['color'],
                        icon: category['icon'],
                        title: category['title']);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

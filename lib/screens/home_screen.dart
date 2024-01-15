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

  List<String> foodStoreNames = [
    'Tasty Bites',
    'Sizzling Grills',
    'Spice Paradise',
    'Munch n Crunch',
    'Fresh Delights',
    'Savory Eats',
    'Yummy Fusion',
    'Crispy Crust',
    'Taste Haven',
    'Gourmet Bliss',
    'Flavorful Bites',
    'Chefs Choice',
    'Delicious Dishes',
    'Mouthwatering Cuisine',
    'Soulful Plates',
    'Tantalizing Treats',
    'Epicurean Delicacies',
    'Hearty Feasts',
    'Gastronomic Delights',
  ];

  List<Map<String, dynamic>> _discount = [
    {
      'title': "Seafood",
      'distance': 2,
      'estimationTime': 12,
      'rating': 4, // rating come from 1 to 5
      'sold': 100
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                          decoration: BoxDecoration(color: Colors.transparent),
                          child:
                              Image.network("https://picsum.photos/800/400"));
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hottest discount",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(color: Colors.deepOrangeAccent),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 2,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Image.network(
                                        "https://picsum.photos/200/200",
                                        height: 50),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "31 mi * 12 min",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          fontSize: 14,
                                          color: Colors.grey.withOpacity(0.5),
                                        ),
                                      ),
                                      Text(
                                        "Title",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "* 4.8 * 225 sold",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          fontSize: 14,
                                          color: Colors.grey.withOpacity(0.5),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

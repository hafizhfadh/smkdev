import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smkdev/components/detail/food_app_bar_component.dart';
import 'package:smkdev/repositories/data/cart.dart';
import 'package:smkdev/repositories/state/cart_state.dart';
import 'package:smkdev/utils/food_icon_icons.dart';

class DetailMerchantScreen extends StatefulWidget {
  const DetailMerchantScreen({super.key});

  @override
  State<DetailMerchantScreen> createState() => _DetailMerchantScreenState();
}

class _DetailMerchantScreenState extends State<DetailMerchantScreen> {
  List<CartData> cartDataList = [];

  @override
  initState() {
    super.initState();
    generateCartDataList(10);
  }

  Future<void> generateCartDataList(int numberOfItems) async {
    var _cartDataList = List.generate(numberOfItems, (index) {
      Random random = Random();
      return CartData(
        cover: "https://picsum.photos/100$index/100$index",
        title: "Nama Makanan #00$index",
        ingredient: "prone, crab, tuna, caramel",
        price: random.nextInt(50) + 10,
        // Random price between 10 and 60
        order: random.nextInt(5), // Random order quantity between 0 and 4
      );
    });
    setState(() {
      cartDataList = _cartDataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const FoodAppBar(),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    padding: const EdgeInsets.only(right: 20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      image: DecorationImage(
                        image: NetworkImage("https://picsum.photos/1000/1000",
                            scale: 4),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height / 6,
                    width: MediaQuery.sizeOf(context).width / 1.8,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Seafood specialist #0001",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        const Text(
                          "Mr. Liem Suei",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Text(
                          "Seafood, Japanese",
                          style: TextStyle(
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 12,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  "4.8 \u2022 225 sold",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 14,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                            const Text("|"),
                            Text(
                              "31 mi \u2022 12 min",
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 1.5,
              child: RefreshIndicator(
                onRefresh: () => generateCartDataList(20),
                child: ListView.builder(
                    itemCount: cartDataList.length,
                    itemBuilder: (context, index) {
                      CartData cartData = cartDataList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              padding: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(cartData.cover),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width / 2.3,
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartData.title,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    "Complete: ${cartData.ingredient}",
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.withOpacity(0.4),
                                    ),
                                  ),
                                  Text(
                                    "\$ ${cartData.price}",
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Transform.scale(
                                  scale: 0.6,
                                  child: IconButton.filled(
                                    onPressed: () {
                                      setState(() {
                                        if (cartData.order > 0) {
                                          cartData.order--;
                                        }
                                      });
                                    },
                                    icon: const Icon(Icons.remove),
                                    color: Colors.white,
                                    style: IconButton.styleFrom(
                                        backgroundColor: Colors.deepOrange),
                                  ),
                                ),
                                Text("${cartData.order}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                                Transform.scale(
                                  scale: 0.6,
                                  child: IconButton.filledTonal(
                                    onPressed: () {
                                      setState(() {
                                        cartData.order++;
                                      });
                                    },
                                    icon: const Icon(Icons.add),
                                    color: Colors.white,
                                    style: IconButton.styleFrom(
                                        backgroundColor: Colors.deepOrange),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

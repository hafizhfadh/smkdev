import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smkdev/components/detail/food_app_bar_component.dart';
import 'package:smkdev/utils/food_icon_icons.dart';

class DetailMerchantScreen extends StatelessWidget {
  const DetailMerchantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            FoodAppBar(),
            Padding(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    padding: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
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
                        Text(
                          "Seafood specialist #0001",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Text(
                          "Mr. Liem Suei",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Text("Seafood, Japanese", style: TextStyle(color: Colors.grey.withOpacity(0.4),),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
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
                            Text("|"),
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
          ],
        ),
      ),
    );
  }
}

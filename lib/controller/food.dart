import 'package:flutter/material.dart';
import 'package:fyp_test/controller/customText.dart';
import 'package:fyp_test/general/screenNavigation.dart';
import 'package:fyp_test/general/themeColor.dart';
import 'package:fyp_test/models/food.dart';
import 'package:fyp_test/provider/food.dart';
import 'package:fyp_test/provider/restaurant.dart';
import 'package:provider/provider.dart';

class FoodController extends StatelessWidget {
  final FoodModel food;

  const FoodController({Key key, this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final foodProvider = Provider.of<FoodProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 10),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(-2, -1),
                  blurRadius: 5),
            ]),
        child: Row(
          children: <Widget>[
            Container(
              width: 140,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: Text(food.image.toString()),
                // child: Image.network(
                //   food.image,
                //   fit: BoxFit.fill,
                // ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: food.name,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[300],
                                    offset: Offset(1, 1),
                                    blurRadius: 4),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.favorite_border,
                              color: blue,
                              size: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: CustomText(
                              text: food.rating.toString(),
                              color: grey,
                              size: 14.0,
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(
                            Icons.star,
                            color: blue,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: blue,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: blue,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: blue,
                            size: 16,
                          ),
                          Icon(
                            Icons.star_border,
                            color: blue,
                            size: 16,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CustomText(
                          text: "\$${food.price}",
                          weight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

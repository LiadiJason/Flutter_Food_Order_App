import 'package:flutter/material.dart';
import 'package:fyp_test/general/screenNavigation.dart';
import 'package:fyp_test/models/food.dart';
import 'package:fyp_test/models/foods.dart';
import 'package:fyp_test/provider/food.dart';
import 'package:fyp_test/provider/restaurant.dart';
import 'package:fyp_test/view/details.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import '../general/themeColor.dart';
import 'customText.dart';
import 'loadingPage.dart';

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final foodProvider = Provider.of<FoodProvider>(context);
    return Container(
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: foodProvider.foods.length,
          itemBuilder: (_, index) {
            return Padding(
                padding: EdgeInsets.fromLTRB(12, 14, 16, 12),
                child: GestureDetector(
                  onTap: () {
                    changeScreen(
                        _,
                        Details(
                          food: foodProvider.foods[index],
                        ));
                  },
                  child: Container(
                    height: 220,
                    width: 200,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: blue[50],
                              offset: Offset(15, 5),
                              blurRadius: 30)
                        ]),
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                  child: Align(
                                alignment: Alignment.center,
                                child: Loading(),
                              )),
                              Center(
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: foodProvider.foods[index].image,
                                  height: 126,
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CustomText(
                                text: foodProvider.foods[index].name,
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
                                          color: grey[300],
                                          offset: Offset(1, 1),
                                          blurRadius: 4)
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CustomText(
                                    text: foodProvider.foods[index].rating
                                        .toString(),
                                    color: grey,
                                    size: 14,
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
                                  Icons.star,
                                  color: grey,
                                  size: 16,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CustomText(
                                text: '\$' +
                                    foodProvider.foods[index].price.toString(),
                                weight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}

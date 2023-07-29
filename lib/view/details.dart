import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fyp_test/controller/customText.dart';
import 'package:fyp_test/general/screenNavigation.dart';
import 'package:fyp_test/general/themeColor.dart';
import 'package:fyp_test/models/food.dart';
import 'package:fyp_test/provider/cart.dart';
import 'package:fyp_test/provider/user.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class Details extends StatefulWidget {
  final FoodModel food;

  Details({@required this.food});

  @override
  _State createState() => _State();
}

class _State extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 325,
              child: Stack(
                children: <Widget>[
                  Carousel(
                    images: [
                      // AssetImage('assets/images/${widget.food.image}'),
                      Image.network(widget.food.image)
                    ],
                    dotBgColor: white,
                    dotColor: grey,
                    dotIncreaseSize: 1.5,
                    dotIncreasedColor: blue,
                    autoplay: false,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Stack(
                                children: <Widget>[
                                  // Image.asset(
                                  //   'assets/images/cart.png',
                                  //   width: 30,
                                  //   height: 30,
                                  // ),
                                  IconButton(
                                      icon: Icon(Icons.shopping_cart),
                                      onPressed: () {
                                        changeScreen(context, Cart());
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomText(
              text: widget.food.name,
              size: 24,
              weight: FontWeight.bold,
            ),
            CustomText(
              text: 'RM ' + widget.food.price.toString(),
              size: 18,
              weight: FontWeight.normal,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.remove,
                      size: 28,
                    ),
                    onPressed: () {
                      if (!cartProvider.checkUserCart(userProvider.user.uid)) {
                        cartProvider.removeItemFromCart(
                            widget.food, userProvider.user.uid);
                      }
                    }),
                GestureDetector(
                  onTap: () {
                    cartProvider.addItemToCart(
                        widget.food, userProvider.user.uid);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                      child: CustomText(
                        text: 'Add to cart',
                        color: white,
                        size: 24,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 28,
                    ),
                    onPressed: () {
                      cartProvider.addItemToCart(
                          widget.food, userProvider.user.uid);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}

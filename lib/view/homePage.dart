import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fyp_test/controller/bottomNavigation.dart';
import 'package:fyp_test/controller/categories.dart';
import 'package:fyp_test/controller/customText.dart';
import 'package:fyp_test/controller/featuredFood.dart';
import 'package:fyp_test/controller/food.dart';
import 'package:fyp_test/controller/restaurants.dart';
import 'package:fyp_test/provider/cart.dart';
import 'package:fyp_test/provider/category.dart';
import 'package:fyp_test/provider/food.dart';
import 'package:fyp_test/provider/restaurant.dart';
import 'package:fyp_test/provider/user.dart';
import 'package:fyp_test/general/themeColor.dart';
import 'package:fyp_test/general/screenNavigation.dart';
import 'package:fyp_test/view/cart.dart';
import 'package:fyp_test/view/category.dart';
import 'package:fyp_test/view/loginScreen.dart';
import 'package:fyp_test/view/payment.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final restauranProvider = Provider.of<RestaurantProvider>(context);
    final foodProvider = Provider.of<FoodProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        elevation: 0.5,
        backgroundColor: blue,
        title: CustomText(
          text: 'D-Meli Cafeteria',
          color: white,
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    changeScreen(context, Cart());
                  }),
            ],
          ),
          Stack(
            children: [
              IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: blue, borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
          Stack(
            children: [
              IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    userProvider.signOut();
                    changeScreenReplacement(context, LoginScreen());
                  }),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: blue, borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: blue),
                accountName: CustomText(
                  text: 'Welcome ' + userProvider.userModel.name + '!',
                  color: white,
                  weight: FontWeight.bold,
                  size: 18,
                ),
                accountEmail: CustomText(
                  text: userProvider.userModel.email,
                  color: grey[400],
                )),
            ListTile(
              onTap: () {
                changeScreen(context, HomePage());
              },
              leading: Icon(Icons.home),
              title: CustomText(
                text: 'Home',
              ),
            ),
            ListTile(
              onTap: () {
                changeScreen(context, Cart());
              },
              leading: Icon(Icons.shopping_cart),
              title: CustomText(
                text: 'Cart',
              ),
            ),
            ListTile(
              onTap: () {
                userProvider.signOut();
                changeScreenReplacement(context, LoginScreen());
              },
              leading: Icon(Icons.logout),
              title: CustomText(
                text: 'Logout',
              ),
            )
          ],
        ),
      ),
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 8, right: 8, bottom: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: blue,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                          hintText: 'Find food and restaurant',
                          border: InputBorder.none),
                    ),
                    trailing: Icon(
                      Icons.filter_list,
                      color: blue,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryProvider.categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        await foodProvider.showFoodByCategory(
                            categoryName:
                                categoryProvider.categories[index].name);
                        changeScreen(
                            context,
                            CategoryScreen(
                              categoryModel: categoryProvider.categories[index],
                            ));
                      },
                      child: CategoryController(
                        category: categoryProvider.categories[index],
                      ),
                    );
                  },
                )),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    text: 'Featured',
                    size: 18,
                    color: black,
                  ),
                ],
              ),
            ),
            Featured(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  CustomText(
                    text: 'Popular Stall',
                    size: 18,
                    color: black,
                  ),
                ],
              ),
            ),
            Column(
              children: restauranProvider.restaurants
                  .map((item) => GestureDetector(
                        onTap: () {},
                        child: RestaurantController(
                          restaurant: item,
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 55,
        color: white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BottomNavigation(
                image: 'home.png',
              ),
              BottomNavigation(
                onTap: () {
                  changeScreen(context, Cart());
                },
                image: 'cart.png',
              ),
              BottomNavigation(
                onTap: () {
                  changeScreen(context, Payment());
                },
                image: 'cash.png',
              )
            ],
          ),
        ),
      ),
    );
  }
}

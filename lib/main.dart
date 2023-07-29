import 'package:flutter/material.dart';
import 'package:fyp_test/controller/loadingPage.dart';
import 'package:fyp_test/provider/cart.dart';
import 'package:fyp_test/provider/category.dart';
import 'package:fyp_test/provider/food.dart';
import 'package:fyp_test/provider/restaurant.dart';
import 'package:fyp_test/provider/user.dart';
import 'package:fyp_test/view/homePage.dart';
import 'package:fyp_test/view/loginScreen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
        ChangeNotifierProvider.value(value: RestaurantProvider.initialize()),
        ChangeNotifierProvider.value(value: FoodProvider.initialize()),
        ChangeNotifierProvider.value(value: CartProvider.initialize())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cafeteria App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: ScreenController())));
}

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authentication = Provider.of<UserProvider>(context);
    switch (authentication.status) {
      case Status.Authenticated:
        return HomePage();
      default:
        return LoginScreen();
    }
  }
}

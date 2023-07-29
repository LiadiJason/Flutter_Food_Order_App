import 'package:flutter/material.dart';
import 'package:fyp_test/helpers/restaurantHelpers.dart';
import 'package:fyp_test/models/restaurant.dart';

class RestaurantProvider with ChangeNotifier {
  RestaurantServices _restaurantServices = RestaurantServices();
  List<RestaurantModel> restaurants = [];

  RestaurantProvider.initialize() {
    showRestaurant();
  }

  Future showRestaurant() async {
    restaurants = await _restaurantServices.getRestaurant();
    notifyListeners();
  }

  //
}

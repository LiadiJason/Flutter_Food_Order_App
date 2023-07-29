import 'package:flutter/material.dart';
import 'package:fyp_test/controller/food.dart';
import 'package:fyp_test/helpers/foodHelpers.dart';
import 'package:fyp_test/models/food.dart';

class FoodProvider with ChangeNotifier {
  FoodServices _foodServices = FoodServices();
  List<FoodModel> foods = [];
  List<FoodModel> foodByCategory = [];
  List<FoodModel> foodByRestaurant = [];
  List<FoodModel> foodBySearch = [];

  FoodProvider.initialize() {
    showFood();
  }

  showFood() async {
    foods = await _foodServices.getFood();
    notifyListeners();
  }

  Future showFoodByCategory({String categoryName}) async {
    foodByCategory =
        await _foodServices.getFoodByCategory(category: categoryName);
    notifyListeners();
  }

  Future showFoodByRestaurant({String restaurantId}) async {
    foodByRestaurant =
        await _foodServices.getFoodByRestaurant(id: restaurantId);
    notifyListeners();
  }
}

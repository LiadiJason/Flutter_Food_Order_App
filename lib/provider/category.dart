import 'package:flutter/material.dart';
import 'package:fyp_test/helpers/categoryHelpers.dart';
import 'package:fyp_test/models/category.dart';

class CategoryProvider with ChangeNotifier {
  CategoryServices _categoryServices = CategoryServices();
  List<CategoryModel> categories = [];

  CategoryProvider.initialize() {
    _showCategories();
  }

  _showCategories() async {
    categories = await _categoryServices.getCategory();
    notifyListeners();
  }
}

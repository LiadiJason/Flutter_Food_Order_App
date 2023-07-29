import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp_test/controller/featuredFood.dart';

class FoodModel {
  static String ID = 'id';
  static String NAME = 'name';
  static String DESCRIPTION = 'description';
  static String RATING = 'rating';
  static String IMAGE = 'image';
  static String PRICE = 'price';
  static String RESTAURANT_ID = 'restaurantId';
  static String RESTAURANT = 'restaurant';
  static String CATEGORY = 'category';
  static String FEATURED = 'featured';
  static String RATES = 'rates';
  static String PREPARATION_TIME = 'preparationTime';

  int _id;
  String _name;
  String _description;
  double _rating;
  String _image;
  int _price;
  int _restaurantId;
  String _restaurant;
  String _category;
  bool _featured;
  int _rates;
  String _preparationTime;

  int get id => _id;
  String get name => _name;
  String get description => _description;
  double get rating => _rating;
  String get image => _image;
  int get price => _price;
  int get restaurantId => _restaurantId;
  String get restaurant => _restaurant;
  String get category => _category;
  bool get featured => _featured;
  int get rates => _rates;
  String get preparationTime => _preparationTime;

  FoodModel() {
    this._id = null;
    this._name = '';
    this._description = '';
    this._rating = null;
    this._image = '';
    this._price = null;
    this._restaurantId = null;
    this._restaurant = '';
    this._category = '';
    this._featured = false;
    this._rates = null;
    this._preparationTime = '';
  }

  FoodModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _description = snapshot.data[DESCRIPTION];
    _rating = snapshot.data[RATING];
    _image = snapshot.data[IMAGE];
    _price = snapshot.data[PRICE];
    _restaurantId = snapshot.data[RESTAURANT_ID];
    _restaurant = snapshot.data[RESTAURANT];
    _category = snapshot.data[CATEGORY];
    _featured = snapshot.data[FEATURED];
    _rates = snapshot.data[RATES];
    _preparationTime = snapshot.data[PREPARATION_TIME];
  }
}

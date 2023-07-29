import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  static String ID = 'id';
  static String NAME = 'name';
  static String RATING = 'rating';
  static String IMAGE = 'image';
  static String POPULAR = 'popular';
  static String RATES = 'rates';

  int _id;
  String _name;
  double _rating;
  String _image;
  bool _popular;
  int _rates;

  int get id => _id;
  String get name => _name;
  double get rating => _rating;
  String get image => _image;
  bool get popular => _popular;
  int get rates => _rates;

  RestaurantModel() {
    this._id = null;
    this._name = '';
    this._rating = null;
    this._image = '';
    this._popular = false;
    this._rates = null;
  }

  RestaurantModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _rating = snapshot.data[RATING];
    _image = snapshot.data[IMAGE];
    _popular = snapshot.data[POPULAR];
    _rates = snapshot.data[RATES];
  }
}

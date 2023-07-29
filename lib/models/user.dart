import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static String ID = 'id';
  static String NAME = 'name';
  static String EMAIL = 'email';
  // static String LIKED_FOOD = 'likedFood';
  static String STRIPE_ID = 'stripeId';

  String _id;
  String _name;
  String _email;
  // List _likedFood;
  String _stripeId;

  String get id => _id;
  String get name => _name;
  String get email => _email;
  // List get likedFood => _likedFood;
  String get stripeId => _stripeId;

  UserModel() {
    this._id = '';
    this._name = 'Unknown User';
    this._email = '';
    // this._likedFood = [];
    this._stripeId = '';
  }

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    // _likedFood = snapshot.data[LIKED_FOOD] ?? null;
    _stripeId = snapshot.data[STRIPE_ID];
  }
}

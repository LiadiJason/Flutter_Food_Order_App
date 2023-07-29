import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  static String ID = 'id';
  static String DESCRIPTION = 'description';
  static String PRODUCT_ID = 'productId';
  static String USER_ID = 'userId';
  static String AMOUNT = 'amount';
  static String STATUS = 'status';
  static String DATE_CREATED = 'dateCreated';

  String _id;
  String _description;
  String _productId;
  String _userId;
  double _amount;
  String _status;
  int _dateCreated;

  String get id => _id;
  String get description => _description;
  String get productId => _productId;
  String get userId => _userId;
  double get amount => _amount;
  String get status => _status;
  int get dateCreated => _dateCreated;

  OrderModel() {
    this._id = '';
    this._description = '';
    this._productId = '';
    this._userId = '';
    this._amount = null;
    this._status = '';
    this._dateCreated = null;
  }

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _description = snapshot.data[DESCRIPTION];
    _productId = snapshot.data[PRODUCT_ID];
    _userId = snapshot.data[USER_ID];
    _amount = snapshot.data[AMOUNT];
    _status = snapshot.data[STATUS];
    _dateCreated = snapshot.data[DATE_CREATED];
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  static String ID = 'id';
  static List<dynamic> PRODUCTLIST = [];

  String id;
  List<dynamic> productlist;

  CartModel() {
    this.id = null;
    this.productlist = [];
  }

  CartModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.data[ID];
    productlist = snapshot.data[PRODUCTLIST];
  }
}

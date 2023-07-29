import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp_test/models/cart.dart';

class CartServices {
  String collection = 'cart';
  Firestore _firestore = Firestore.instance;

  Future<List<CartModel>> getCart() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<CartModel> cart = [];
        for (DocumentSnapshot carts in result.documents) {
          cart.add(CartModel.fromSnapshot(carts));
        }
        return cart;
      });
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_test/helpers/cartHelpers.dart';
import 'package:fyp_test/models/cart.dart';
import 'package:fyp_test/models/food.dart';

class CartProvider with ChangeNotifier {
  CartServices _cartServices = CartServices();
  List<CartModel> cart = [];

  CartProvider.initialize() {
    _showCarts();
  }

  _showCarts() async {
    cart = await _cartServices.getCart();
    notifyListeners();
  }

  bool checkUserCart(String uid) {
    bool checking = false;
    for (var c in cart) {
      if (c.id == uid) {
        if (c.productlist != null) {
          checking = true;
        }
      }
    }
    return checking;
  }

  addItemToCart(FoodModel addFood, String uid) async {
    CartModel newcart = new CartModel();
    var document = await Firestore.instance
        .collection('cart')
        .document(uid)
        .get()
        .then((doc) {
      if (doc.data != null) {
        newcart.id = doc.data["id"];
        newcart.productlist = doc.data["cartList"];
      }
    });

    newcart.productlist.add({
      "id": addFood.id,
      "name": addFood.name,
      "image": addFood.image,
      "price": addFood.price
    });

    Firestore.instance.collection("cart").document(uid).setData({
      "id": uid,
      "cartList": newcart.productlist,
    });
  }

  removeItemFromCart(FoodModel removeFood, String uid) async {
    CartModel newcart = new CartModel();
    var document = await Firestore.instance
        .collection('cart')
        .document(uid)
        .get()
        .then((doc) {
      if (doc.data != null) {
        newcart.id = doc.data["id"];
        newcart.productlist = doc.data["cartList"];
      }
    });

    int index = newcart.productlist
        .indexWhere((element) => element["id"] == removeFood.id);
    newcart.productlist.removeAt(index);
    Firestore.instance.collection("cart").document(uid).updateData({
      "cartList": newcart.productlist,
    });
  }
}

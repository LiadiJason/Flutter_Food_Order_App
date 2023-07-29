import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_test/controller/customText.dart';
import 'package:fyp_test/general/themeColor.dart';
import 'package:fyp_test/models/food.dart';
import 'package:fyp_test/models/foods.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<dynamic> newlist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: black),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: white,
          centerTitle: true,
          title: CustomText(
            text: 'My Cart',
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      'assets/images/cart.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: white,
        body: FutureBuilder(
          future: Firestore.instance.collection("cart").getDocuments(),
          builder: (ctx, snap) {
            if (snap.hasData) {
              var data = snap.data.documents[0]["cartList"];
              print(data);
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (ctx, i) {
                    return ListTile(
                      leading: Image.network(data[i]["image"]),
                      title: Text(data[i]["name"]),
                      subtitle: Text("\$ " + data[i]["price"].toString()),
                      trailing: ElevatedButton(
                        child: Icon(Icons.delete),
                        onPressed: () {},
                      ),
                    );
                  });
            }
            return Container();
          },
        ));
  }
}

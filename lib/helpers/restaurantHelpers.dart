import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp_test/models/restaurant.dart';

class RestaurantServices {
  String collection = 'restaurant';
  Firestore _firestore = Firestore.instance;

  Future<List<RestaurantModel>> getRestaurant() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<RestaurantModel> restaurant = [];
        for (DocumentSnapshot restaurants in result.documents) {
          restaurant.add(RestaurantModel.fromSnapshot(restaurants));
        }
        return restaurant;
      });

  Future<RestaurantModel> getRestaurantById({String id}) => _firestore
          .collection(collection)
          .document(id.toString())
          .get()
          .then((doc) {
        return RestaurantModel.fromSnapshot(doc);
      });
}

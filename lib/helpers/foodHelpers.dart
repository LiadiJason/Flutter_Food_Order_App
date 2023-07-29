import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp_test/models/food.dart';

class FoodServices {
  String collection = 'food';
  Firestore _firestore = Firestore.instance;

  Future<List<FoodModel>> getFood() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<FoodModel> food = [];
        for (DocumentSnapshot foods in result.documents) {
          food.add(FoodModel.fromSnapshot(foods));
        }
        return food;
      });

  void likedFood({String id, List<String> userLikes}) {
    _firestore
        .collection(collection)
        .document(id)
        .updateData({'userLikes': userLikes});
  }

  Future<List<FoodModel>> getFoodByRestaurant({String id}) async => _firestore
          .collection(collection)
          .where('restaurantId', isEqualTo: id)
          .getDocuments()
          .then((result) {
        List<FoodModel> food = [];
        for (DocumentSnapshot foods in result.documents) {
          food.add(FoodModel.fromSnapshot(foods));
        }
        return food;
      });

  Future<List<FoodModel>> getFoodByCategory({String category}) async =>
      _firestore
          .collection(collection)
          .where('category', isEqualTo: category)
          .getDocuments()
          .then((result) {
        List<FoodModel> food = [];
        for (DocumentSnapshot foods in result.documents) {
          food.add(FoodModel.fromSnapshot(foods));
          print(food.last.name);
        }
        print(food.length);

        return food;
      });
}

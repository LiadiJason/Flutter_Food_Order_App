import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp_test/models/category.dart';

class CategoryServices {
  String collection = 'category';
  Firestore _firestore = Firestore.instance;

  Future<List<CategoryModel>> getCategory() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<CategoryModel> category = [];
        for (DocumentSnapshot categories in result.documents) {
          category.add(CategoryModel.fromSnapshot(categories));
        }
        return category;
      });
}

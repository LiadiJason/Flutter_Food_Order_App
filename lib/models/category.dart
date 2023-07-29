import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  static String ID = 'id';
  static String NAME = 'name';
  static String IMAGE = 'image';

  int _id;
  String _name;
  String _image;

  int get id => _id;
  String get name => _name;
  String get image => _image;

  CategoryModel() {
    this._id = null;
    this._name = '';
    this._image = '';
  }

  CategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _image = snapshot.data[IMAGE];
  }
}

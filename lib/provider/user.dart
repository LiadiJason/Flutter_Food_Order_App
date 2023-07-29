import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_test/helpers/userHelpers.dart';
import 'package:fyp_test/models/user.dart';

enum Status { Uninitialized, Authenticated, Authenticating, UnAuthenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _authentication;
  FirebaseUser _user;
  Firestore _firestore = Firestore.instance;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  UserModel _userModel;

  UserModel get userModel => _userModel;
  Status get status => _status;
  FirebaseUser get user => _user;

  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  UserProvider.initialize() : _authentication = FirebaseAuth.instance {
    _authentication.onAuthStateChanged.listen(_onStateChanged);
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _authentication.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      return true;
    } catch (e) {
      _status = Status.UnAuthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _authentication
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        _firestore.collection('users').document(result.user.uid).setData({
          'name': name.text,
          'email': email.text,
          'uid': result.user.uid,
          'likedFood': [],
        });
      });
      return true;
    } catch (e) {
      _status = Status.UnAuthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut() {
    _authentication.signOut();
    _status = Status.UnAuthenticated;
    UserModel userModel = new UserModel();
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.UnAuthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(user.uid);
    }
    notifyListeners();
  }

  void cleanController() {
    email.text = '';
    password.text = '';
    name.text = '';
  }
}

import 'package:flutter/material.dart';
import 'package:fyp_test/controller/customText.dart';
import 'package:fyp_test/controller/loadingPAge.dart';
import 'package:fyp_test/provider/user.dart';
import 'package:fyp_test/general/themeColor.dart';
import 'package:fyp_test/general/screenNavigation.dart';
import 'package:fyp_test/view/loginScreen.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authenticationProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      backgroundColor: white,
      body: authenticationProvider.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/dmeli_cafeteria.png',
                        width: 200,
                        height: 200,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: authenticationProvider.name,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Username',
                                icon: Icon(Icons.person)),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: authenticationProvider.email,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email',
                                icon: Icon(Icons.email)),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              obscureText: true,
                              controller: authenticationProvider.password,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  icon: Icon(Icons.lock)),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () async {
                        if (!await authenticationProvider.signUp()) {
                          _key.currentState.showSnackBar(
                              SnackBar(content: Text('Registration failed!')));
                          return;
                        }
                        authenticationProvider.cleanController();
                        changeScreenReplacement(context, LoginScreen());
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: blue,
                              border: Border.all(color: grey),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CustomText(
                                    text: 'Register',
                                    color: white,
                                    size: 18,
                                  )
                                ],
                              ))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeScreen(context, LoginScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'Have an account? Login here.',
                          size: 14,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

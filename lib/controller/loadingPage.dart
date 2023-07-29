import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fyp_test/general/themeColor.dart';

class Loading extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitFadingCircle(
            color: Colors.black,
            size: 30,
          )
        ],
      ),
    );
  }
}

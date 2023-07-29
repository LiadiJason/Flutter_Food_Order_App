import 'package:flutter/material.dart';

//Screen A can go to Screen B, and can go back to Screen A
void changeScreen(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

//Screen A can go to Screen B, but cannot go back to Screen A
void changeScreenReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}

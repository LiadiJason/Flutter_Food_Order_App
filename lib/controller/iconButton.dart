import 'package:flutter/material.dart';
import 'package:fyp_test/general/themeColor.dart';

class IconButtons extends StatelessWidget {
  final IconData iconData;
  IconButtons(this.iconData);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            iconData,
            size: 16,
            color: white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final String image;
  final Function onTap;

  const BottomNavigation({@required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap ?? null,
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/${image}',
              width: 22,
              height: 22,
            ),
          ],
        ),
      ),
    );
  }
}

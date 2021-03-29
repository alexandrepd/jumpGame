import 'package:flutter/material.dart';

class Duck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: Image.asset('images/duck.png'),
    );
  }
}

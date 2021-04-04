import 'package:flutter/material.dart';

class Duck extends StatelessWidget {
  Duck({this.up});
  final bool up;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: up
          ? Image.asset('images/duck1.png')
          : Image.asset('images/duck2.png'),
    );
  }
}

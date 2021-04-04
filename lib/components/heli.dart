import 'package:flutter/material.dart';
import 'package:jumpGame/core/utils.dart';

class Heli extends StatefulWidget {
  @override
  _HeliState createState() => _HeliState();
}

class _HeliState extends State<Heli> {
  GlobalKey _key = GlobalKey();

  double componentHorizontalPosition;
  double componentVerticalPosition;

  @override
  void initState() {
    componentHorizontalPosition = randomDoubleInRange();
    componentVerticalPosition = randomDoubleInRange();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    componentHorizontalPosition = componentHorizontalPosition - 0.01;
    if (componentHorizontalPosition < -2.2) {
      componentHorizontalPosition = 1.5;
      componentVerticalPosition = randomDoubleInRange();
    }
    return AnimatedContainer(
      alignment:
          Alignment(componentHorizontalPosition, componentVerticalPosition),
      duration: Duration(milliseconds: 0),
      // color: Colors.blue,
      child: Container(
        key: _key,
        height: 60,
        width: 60,
        child: Image.asset('images/heli.png'),
      ),
    );
  }
}

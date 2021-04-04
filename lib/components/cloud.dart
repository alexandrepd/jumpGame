import 'package:flutter/material.dart';
import 'package:jumpGame/core/utils.dart';

class Cloud extends StatefulWidget {
  @override
  _CloudState createState() => _CloudState();
}

class _CloudState extends State<Cloud> {
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
      child: Container(
        height: 100,
        width: 100,
        child: Image.asset('images/cloud.png'),
      ),
    );
  }
}

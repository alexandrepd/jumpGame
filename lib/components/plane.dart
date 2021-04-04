import 'package:flutter/material.dart';
import 'package:jumpGame/core/utils.dart';

class Plane extends StatefulWidget {
  @override
  _PlaneState createState() => _PlaneState();
}

class _PlaneState extends State<Plane> {
  double _componentHorizontalPosition;
  double _componentVerticalPosition;

  @override
  void initState() {
    _componentHorizontalPosition = randomDoubleInRange();
    _componentVerticalPosition = randomDoubleInRange();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _componentHorizontalPosition = _componentHorizontalPosition + 0.01;
    if (_componentHorizontalPosition > 2.2) {
      _componentHorizontalPosition = randomDoubleInRange(min: -1.5, max: -2.5);
      _componentVerticalPosition = randomDoubleInRange();
    }
    return AnimatedContainer(
      alignment:
          Alignment(_componentHorizontalPosition, _componentVerticalPosition),
      duration: Duration(milliseconds: 0),
      // color: Colors.blue,
      child: Container(
        height: 100,
        width: 100,
        child: Image.asset('images/plane.png'),
      ),
    );
  }
}

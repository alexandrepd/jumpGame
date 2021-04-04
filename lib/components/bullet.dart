import 'package:flutter/material.dart';
import 'package:jumpGame/core/utils.dart';

class Bullet extends StatefulWidget {
  @override
  _BulletState createState() => _BulletState();
}

class _BulletState extends State<Bullet> {
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
        height: 100,
        width: 100,
        child: Image.asset('images/bullet.png'),
      ),
    );
  }
}

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jumpGame/components/duck.dart';
import 'package:jumpGame/components/heli.dart';
import 'package:jumpGame/components/cloud.dart';
import 'package:jumpGame/components/plane.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double duckVerticalPosition = 0;
  static double cloudHorizontalPosition = 0;
  double time = 0;
  double height = 0;
  double initialHeight = 0;
  bool hasStartedGame = false;

  int recorde = 0;
  int resultado = 0;

  double randomDoubleInRange({double min = -1.0, double max = 1.0}) {
    return Random().nextDouble() * (max - min + 1.0) + min;
  }

  void jump() {
    resultado++;
    recorde = resultado > recorde ? resultado : recorde;
    time = 0;
    initialHeight = duckVerticalPosition;
  }

  void startGame() {
    cloudHorizontalPosition = randomDoubleInRange();
    hasStartedGame = true;
    Timer.periodic(Duration(milliseconds: 20), (timer) {
      print('Timer ' + timer.tick.toString());

      time += 0.01;
      print('Time: $time');

      height = -4.9 * time * time + 2.8 * time;
      print('Height $height');
      setState(() {
        cloudHorizontalPosition -= 0.01;
        duckVerticalPosition = initialHeight - height;
      });
      // print('Duck Position: $duckVerticalPosition');
      if (duckVerticalPosition > 0.998760000000003) {
        timer.cancel();
        // resetAll();
      }

      if (cloudHorizontalPosition < -2.2) {
        cloudHorizontalPosition = 1.2;
      }
    });
  }

  void resetAll() {
    setState(() {
      duckVerticalPosition = 0;
      time = 0;
      height = 0;
      initialHeight = 0;
      hasStartedGame = false;
      cloudHorizontalPosition = 2;
      resultado = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (hasStartedGame) {
            jump();
          } else {
            startGame();
          }
        },
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  AnimatedContainer(
                    alignment: Alignment(cloudHorizontalPosition, -0.75),
                    duration: Duration(milliseconds: 0),
                    color: Colors.blue,
                    child: Cloud(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(cloudHorizontalPosition * 1, -0.50),
                    duration: Duration(milliseconds: 0),
                    child: Heli(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(cloudHorizontalPosition * -1, -0.25),
                    duration: Duration(milliseconds: 0),
                    child: Cloud(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(cloudHorizontalPosition * -1, 0.35),
                    duration: Duration(milliseconds: 0),
                    child: Plane(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(cloudHorizontalPosition * 1.2, 0.0),
                    duration: Duration(milliseconds: 0),
                    child: Cloud(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(0, duckVerticalPosition),
                    duration: Duration(milliseconds: 0),
                    child: Duck(),
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              color: Colors.green,
            ),
            Expanded(
              child: Container(
                alignment: Alignment(0.0, 0.0),
                height: 100,
                color: Colors.brown,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                            child: Text('RESULTADO',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30.0))),
                        Center(
                            child: Text('RECORD',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30.0))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                            child: Text(
                          '$resultado',
                          style: TextStyle(color: Colors.white, fontSize: 40.0),
                        )),
                        Center(
                            child: Text('$recorde',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40.0))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          resetAll();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

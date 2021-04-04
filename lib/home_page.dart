import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jumpGame/components/duck.dart';
import 'package:jumpGame/components/bullet.dart';
import 'package:jumpGame/components/cloud.dart';
import 'package:jumpGame/core/jump_dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double duckVerticalPosition = 0;
  double oldposition = 0.0;
  double time = 0;
  double height = 0;
  double initialHeight = 0;
  bool hasStartedGame = false;
  int recorde = 0;
  int resultado = 0;
  bool up = false;

  void jump() {
    resultado++;
    up = true;
    recorde = resultado > recorde ? resultado : recorde;
    time = 0;
    initialHeight = duckVerticalPosition;
  }

  void startGame() {
    hasStartedGame = true;

    Timer.periodic(Duration(milliseconds: 15), (timer) {
      setState(() {
        time += 0.01;

        height = -5.0 * time * time + 3.5 * time;

        duckVerticalPosition = initialHeight - height;
        print('duckVerticalPosition $duckVerticalPosition');
        if (oldposition < duckVerticalPosition) {
          up = true;
        } else {
          up = false;
        }
        oldposition = duckVerticalPosition;
      });

      if (duckVerticalPosition > 0.998760000000003) {
        timer.cancel();
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
      resultado = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          up = true;
          if (hasStartedGame) {
            jump();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue[100],
                  Colors.blue,
                ]),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    recordInfo(),
                    Cloud(),
                    Cloud(),
                    Bullet(),
                    Cloud(),
                    Cloud(),
                    Bullet(),
                    Cloud(),
                    Cloud(),
                    Bullet(),
                    Cloud(),
                    Cloud(),
                    AnimatedContainer(
                      alignment: Alignment(0, duckVerticalPosition),
                      duration: Duration(milliseconds: 0),
                      child: Duck(
                        up: up,
                      ),
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
                    // alignment: Alignment(0.0, 0.0),
                    height: 100,
                    color: Colors.brown,
                    child: Column(
                      children: [
                        Center(child: pointsInfo()),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildPlayButton(),
                            buildInfoButton(context),
                            buildRefreshButton(),
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  RaisedButton buildRefreshButton() {
    return RaisedButton(
      color: Colors.brown,
      child: Icon(
        Icons.refresh,
        color: Colors.white,
      ),
      onPressed: resetAll,
    );
  }

  RaisedButton buildInfoButton(BuildContext context) {
    return RaisedButton(
      color: Colors.brown,
      child: Icon(
        Icons.info,
        color: Colors.white,
      ),
      onPressed: () {
        jumpDialog(context);
      },
    );
  }

  RaisedButton buildPlayButton() {
    return RaisedButton(
      color: Colors.brown,
      child: Icon(
        Icons.play_arrow,
        color: Colors.white,
      ),
      onPressed: () {
        if (hasStartedGame) {
          jump();
        } else {
          startGame();
        }
      },
    );
  }

  Widget recordInfo() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 40.0, 20, 0),
      alignment: Alignment.topRight,
      child: Column(
        children: [
          Text(
            'Record',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$recorde',
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }

  Widget pointsInfo() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
      child: Column(
        children: [
          Text(
            'Atual',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$resultado',
            style: TextStyle(fontSize: 30.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

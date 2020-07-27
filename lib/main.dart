import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffffeb3b),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(180.0),
          child: AppBar(
            title: Text(
              'Dice.',
              style: TextStyle(
                color: const Color(0xffffeb3b),
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: const Color(0xff4a148c),
          ),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 5;
  int rightDiceNumber = 3;
  int leftFlex = 9;
  int rightFlex = 7;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return SafeArea(
      child: FlatButton(
        onPressed: () {
          setState(() {
            leftDiceNumber = Random().nextInt(6) + 1;
            rightDiceNumber = Random().nextInt(6) + 1;
            leftFlex = 4 + leftDiceNumber;
            rightFlex = 4 + rightDiceNumber;
          });
        },
        child: Container(
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: leftFlex,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Image.asset(
                      'images/dice$leftDiceNumber.png',
                      color: const Color(0xff4a148c),
                    ),
                  ),
                ),
                Expanded(
                  flex: rightFlex,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Image.asset(
                      'images/dice$rightDiceNumber.png',
                      color: const Color(0xff4a148c),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

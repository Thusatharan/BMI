import 'package:flutter/material.dart';

class PrintResult extends StatelessWidget {
  PrintResult(
      {@required this.showBmi,
      this.showMessage,
      this.showCaption,
      this.showAge,
      this.showGain});
  final String showBmi;
  final String showCaption;
  final String showMessage;
  final String showAge;
  final String showGain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI Calculator'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Text(
                    'Your Result',
                    style: TextStyle(fontSize: 40.0, color: Colors.white),
                  )),
                  Text(
                    'Your age is ' + showAge,
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  showMessage,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightGreen,
                  ),
                ),
                Text(
                  showBmi,
                  style: TextStyle(
                    fontSize: 120.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Text(
                    showCaption,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
                Text(
                  showGain,
                  style: TextStyle(fontSize: 20.0, color: Colors.teal),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

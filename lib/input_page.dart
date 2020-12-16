import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'const.dart';
import 'mind.dart';
import 'Result_Page.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int userHeight = 170;
  int newWeight = 60;
  int newAge = 25;
  Color globalColor = inactiveIconColor;
  Color asiaColor = inactiveIconColor;

  void colorChange(int gender) {
    if (gender == 1) {
      if (globalColor == inactiveIconColor) {
        globalColor = activeIconColor;
        asiaColor = inactiveIconColor;
      } else {
        globalColor = inactiveIconColor;
      }
    }

    if (gender == 2) {
      if (asiaColor == inactiveIconColor) {
        asiaColor = activeIconColor;
        globalColor = inactiveIconColor;
      } else {
        asiaColor = inactiveIconColor;
      }
    }
  }

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
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        colorChange(1);
                      });
                    },
                    child: Reusable(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.location_off,
                            size: 90.0,
                            color: globalColor,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          IconData(
                            label: 'GLOBAL',
                          ),
                        ],
                      ),
                      colour: activeCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        colorChange(2);
                      });
                    },
                    child: Reusable(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 90.0,
                            color: asiaColor,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          IconData(
                            label: 'SOUTH ASIA',
                          ),
                        ],
                      ),
                      colour: activeCardColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Reusable(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        userHeight.toString(),
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'CM',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: userHeight.toDouble(),
                    min: 20,
                    max: 300,
                    onChanged: (double newValue) {
                      setState(() {
                        userHeight = newValue.round();
                      });
                    },
                    activeColor: activeIconColor,
                    inactiveColor: Colors.white,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusable(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          newWeight.toString(),
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      newWeight--;
                                    });
                                  },
                                  child: Icon(Icons.remove, size: 40.0)),
                            ),
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    newWeight++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 40.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          newAge.toString(),
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    newAge--;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  size: 40.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    newAge++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 40.0,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              FindResult doResult = FindResult(userHeight, newWeight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return PrintResult(
                    showBmi: doResult.findBmi(),
                    showMessage: doResult.findMessage(),
                    showCaption: doResult.findCaption(),
                    showGain: doResult.findGain(),
                    showAge: newAge.toString(),
                  );
                }),
              );
            },
            child: Center(
              child: Container(
                color: bottomContainerColor,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: bottomContainerHeight,
                child: Center(
                  child: Text(
                    'CALCULATE BMI',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconData extends StatelessWidget {
  IconData({@required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}

class Reusable extends StatelessWidget {
  Reusable({this.colour, this.cardChild});
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:session2/Modals/BMIInput.dart';
import 'package:session2/Modals/Constants.dart';
import 'package:session2/Screens/ResultScreen.dart';
import 'package:session2/Widgets/BuildCalculateButton.dart';

enum Gender { male, female }

class InputScreen extends StatefulWidget {
  static String routeName = '/';

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender gender;
  double height = 170;
  int weight = 70;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primeryColor,
      appBar: AppBar(
        title: Text('Bmi Calculator'),
        centerTitle: true,
        backgroundColor: primeryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                BuildGender(
                  icon: FontAwesomeIcons.mars,
                  gender: 'Male',
                  pressed: () {
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                  color: gender == Gender.male ? Colors.white : textColor,
                ),
                BuildGender(
                  icon: FontAwesomeIcons.venus,
                  gender: 'Female',
                  color: gender == Gender.female ? Colors.white : textColor,
                  pressed: () {
                    setState(() {
                      gender = Gender.female;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: margin,
              decoration: decoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Height',
                    style: TextStyle(fontSize: 35, color: Colors.teal),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(height.toStringAsFixed(1),
                          style: TextStyle(fontSize: 25, color: textColor)),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 18, color: textColor),
                      ),
                    ],
                  ),
                  Slider(
                      activeColor: Colors.pink,
                      min: 100,
                      max: 220,
                      value: height,
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue;
                        });
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: margin,
                    decoration: decoration,
                    child: BuildColumn(
                      type: 'Weight',
                      value: weight,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: margin,
                    decoration: decoration,
                    child: BuildColumn(
                      type: 'age',
                      value: age,
                    ),
                  ),
                )
              ],
            ),
          ),
          buildCalculateButton(
              pressed: () {
                BMIInput bmiInput = BMIInput(height: height, weight: weight);
                double result = bmiInput.getResult();
                Navigator.pushNamed(context, ResultScreen.routeName,
                    arguments: result);
              },
              name: 'Calculate'),
        ],
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  final IconData icon;
  final Function pressed;
  BuildButton({this.icon, this.pressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(
          icon,
          size: 50,
        ),
        shape: CircleBorder(side: BorderSide(width: 0.5, color: Colors.white)),
        onPressed: pressed);
  }
}

class BuildColumn extends StatefulWidget {
  String type;
  int value;
  BuildColumn({this.type, this.value});
  @override
  _BuildColumnState createState() => _BuildColumnState();
}

class _BuildColumnState extends State<BuildColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Text(
        widget.type,
        style: TextStyle(fontSize: 25, color: textColor),
      ),
      Text(
        '${widget.value}',
        style: TextStyle(fontSize: 25, color: textColor),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BuildButton(
            icon: Icons.add,
            pressed: () {
              setState(() {
                widget.value++;
              });
            },
          ),
          BuildButton(
            icon: Icons.remove,
            pressed: () {
              setState(() {
                widget.value--;
              });
            },
          ),
        ],
      ),
    ]);
  }
}

class BuildGender extends StatelessWidget {
  final String gender;
  final IconData icon;
  final Function pressed;
  final Color color;
  BuildGender({this.gender, this.icon, this.color, this.pressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: pressed,
        child: Container(
          margin: margin,
          decoration: decoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                size: 50,
                color: color,
              ),
              Text(
                gender,
                style: TextStyle(fontSize: 30, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

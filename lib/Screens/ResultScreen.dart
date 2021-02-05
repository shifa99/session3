import 'package:flutter/material.dart';
import 'package:session2/Modals/BMIResult.dart';
import 'package:session2/Modals/Constants.dart';
import 'package:session2/Widgets/BuildCalculateButton.dart';

class ResultScreen extends StatelessWidget {
  static String routeName = 'ScreenB';
  BMIResult bmiResult;
  @override
  Widget build(BuildContext context) {
    double result = ModalRoute.of(context).settings.arguments;
    bmiResult = BMIResult(result);
    bmiResult.setData();

    return Scaffold(
      backgroundColor: primeryColor,
      appBar: AppBar(
        title: Text(
          'BMi Result',
        ),
        centerTitle: true,
        backgroundColor: primeryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Your result',
            style: TextStyle(fontSize: 30, color: textColor),
          ),
          Expanded(
            child: Container(
              decoration: decoration,
              margin: margin,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    bmiResult.type,
                    style: TextStyle(fontSize: 30, color: bmiResult.color),
                  ),
                  Text(
                    bmiResult.result.toStringAsFixed(1),
                    style: TextStyle(fontSize: 25, color: textColor),
                  ),
                  Text(
                    bmiResult.advice,
                    style: TextStyle(fontSize: 30, color: textColor),
                  )
                ],
              ),
            ),
          ),
          buildCalculateButton(
            pressed: () {
              Navigator.pop(context);
            },
            name: 'reculacalte',
          )
        ],
      ),
    );
  }
}

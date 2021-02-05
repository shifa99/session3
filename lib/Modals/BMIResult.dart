import 'package:flutter/material.dart';

class BMIResult {
  final double result;
  Color color;
  String advice;
  String type;
  BMIResult(this.result);
  void setData() {
    if (result < 18.5) {
      this.color = Colors.white;
      this.type = 'underweight';
      this.advice = 'you need to gain weight';
    } else if (result >= 18.5 && result <= 24.9) {
      this.color = Colors.tealAccent;
      this.type = 'normal';
      this.advice = 'You are perfect';
    } else if (result >= 25 && result <= 29.9) {
      this.color = Colors.orange;
      this.type = 'overweight ';
      this.advice = 'you need to lose weight';
    } else {
      this.color = Colors.blueGrey;
      this.type = 'obese ';
      this.advice = 'you need to lose weight and go to jym';
    }
  }
}

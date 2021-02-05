import 'dart:math';

class BMIInput {
  final double height;
  final int weight;
  BMIInput({this.height, this.weight});
  double getResult() {
    return (weight / pow(height / 100, 2));
  }
}

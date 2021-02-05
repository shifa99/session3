import 'package:flutter/material.dart';

Widget buildCalculateButton({Function pressed, String name}) {
  return SizedBox(
    height: 70,
    child: FlatButton(
      onPressed: pressed,
      child: Text(
        name,
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
      color: Colors.pink,
    ),
  );
}

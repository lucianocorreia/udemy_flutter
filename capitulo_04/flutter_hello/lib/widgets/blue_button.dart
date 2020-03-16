import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;

  BlueButton(this.text, this.onPressed, {this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

import 'package:flutter/material.dart';

abstract class BaseButton extends StatelessWidget {
  BaseButton(
      {@required this.text,
      @required this.onPressed,
      this.textColor,
      this.backgroundColor});

  final String text;
  final void Function() onPressed;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: RaisedButton(
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: this.textColor),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0)),
          onPressed: onPressed,
          color: this.backgroundColor),
    );
  }
}

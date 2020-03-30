import 'package:flutter/material.dart';
import 'package:recite_flutter/theme.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({@required this.text, @required this.onPressed});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: RaisedButton(
          child: Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0)),
          onPressed: onPressed,
          color: AppColors.primaryColor),
    );
  }
}

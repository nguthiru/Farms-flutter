import 'package:farms/colorConstants.dart';
import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  final String hintText;
  final Function press;

  const ConfirmButton({Key key, this.hintText, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 280,
        decoration: BoxDecoration(
            border: Border.all(color: tertiaryGreen, width: 3.0),
            borderRadius: BorderRadius.circular(25)),
        child: FlatButton(
          onPressed: press,
          child: Text(hintText, style: TextStyle(color: tertiaryOrange)),
        ));
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String hintText;
  final Function press;

  const CustomButton({Key key, this.hintText, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.lightGreen,
        ),
        child: FlatButton(
          onPressed: press,
          child: Text(hintText, style: TextStyle(color: Colors.white)),
        ));
  }
}

import 'package:farms/colorConstants.dart';
import 'package:flutter/material.dart';

class QuickButtons extends StatelessWidget {
  final String hint;
  final IconData icon;

  const QuickButtons({Key key, this.hint, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 130,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 5),
            )
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            icon,
            size: 23,
            color: accentOrange,
          ),
          Text(
            hint,
            style: TextStyle(
                fontSize: 18, color: primaryGreen, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}

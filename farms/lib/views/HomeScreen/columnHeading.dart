import 'package:farms/colorConstants.dart';
import 'package:flutter/material.dart';

class Headings extends StatelessWidget {
  final String head;
  final Function press;

  const Headings({Key key, this.head, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(head,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: primaryGreen)),
        GestureDetector(
          onTap: press,
          child: Container(
            width: 60,
            height: 20,
            decoration: BoxDecoration(
              color: primaryGreen,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text("View all",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12)),
            ),
          ),
        )
      ],
    );
  }
}

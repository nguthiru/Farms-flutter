import 'package:farms/constants.dart';
import 'package:flutter/material.dart';

class ColumnHeading extends StatelessWidget {
  final String head;

  const ColumnHeading({Key key, @required this.head}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(head, style: columnHeadingAlt),
        Text("View all", style: columnSubheading)
      ],
    );
  }
}

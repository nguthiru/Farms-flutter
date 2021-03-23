import 'package:flutter/material.dart';

class LineContainer extends StatelessWidget {
  final double height;
  final double width;

  const LineContainer({Key key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.green,
    );
  }
}

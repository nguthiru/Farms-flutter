import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  final double size;
  final Color color;
  const Logo({
    Key key,
    @required this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = size / 2.1111;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Farms",
            style: TextStyle(fontSize: size, fontWeight: FontWeight.bold)),
        SvgPicture.asset("Assets/Icons/leaf.svg",
            color: color == null ? Colors.green : color,
            width: width,
            height: width),
      ],
    );
  }
}

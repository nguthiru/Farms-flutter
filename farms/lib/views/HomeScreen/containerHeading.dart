import 'package:farms/colorConstants.dart';
import 'package:farms/models/produce_model.dart';
import 'package:farms/network/urls.dart';
import 'package:flutter/material.dart';

class ContainerHeading extends StatelessWidget {
  final Produce produce;

  const ContainerHeading({Key key, this.produce}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Radius curve1 = Radius.circular(20);
    Radius curve2 = Radius.circular(10);
    return Container(
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: curve1, bottom: curve2),
          color: accentOrange.withOpacity(0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(defaultImage),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(produce.product,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black,
                    )),
                Text(
                  'Kilograms:' + produce.kilograms.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.blueGrey),
                )
              ],
            ),
          ],
        ));
  }
}

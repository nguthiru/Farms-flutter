import 'package:farms/colorConstants.dart';
import 'package:farms/models/produce_model.dart';
import 'package:farms/network/urls.dart';
import 'package:flutter/material.dart';

import 'containerHeading.dart';

class ProduceCard extends StatelessWidget {
  final Produce produce;

  const ProduceCard({Key key, @required this.produce}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Radius curve = Radius.circular(10);

    return Container(
      width: 160,
      height: 115,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 0.3,
              spreadRadius: 0.3,
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20), bottom: Radius.circular(10))),
      child: Column(
        children: [
          ContainerHeading(
            produce: produce,
          ),
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: curve),
            child: Container(
              margin: EdgeInsets.only(top: 1.0),
              height: 110,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(produce.image), fit: BoxFit.cover),
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
    final Radius curve = Radius.circular(20);

    return Container(
      width: 200,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ContainerHeading(
            produce: produce,
          ),
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: curve),
            child: Container(
              margin: EdgeInsets.only(top: 1.0),
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(defaultImage), fit: BoxFit.cover),
              ),
            ),
          )
        ],
      ),
    );
  }
}

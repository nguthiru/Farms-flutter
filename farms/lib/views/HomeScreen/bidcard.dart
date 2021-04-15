import 'package:farms/colorConstants.dart';
import 'package:farms/constants.dart';
import 'package:farms/models/bidsModel.dart';
import 'package:farms/network/urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BidCard extends StatelessWidget {
  final Bids bid;

  const BidCard({Key key, @required this.bid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          padding:
              EdgeInsets.only(left: 3.0, top: 5.0, bottom: 5.0, right: 6.0),
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: primaryGreen,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(bid.produce.image),
                radius: 30,
              ),
              Flexible(
                child: Text('Bidder: ' + bid.user.username.toUpperCase(),
                    style: containerCaptions),
              ),
              _BidDetails(bid: bid),
            ],
          )),
    );
  }
}

class _BidDetails extends StatelessWidget {
  final Bids bid;

  const _BidDetails({Key key, this.bid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Kilograms: ' + bid.kilograms.toString(),
          style: containerCaptions,
        ),
        Text(
          'Price per Kilo: ' + bid.bidPrice.toString(),
          style: containerCaptions,
        ),
      ],
    );
  }
}

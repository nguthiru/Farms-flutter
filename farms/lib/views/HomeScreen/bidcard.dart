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
          padding: EdgeInsets.symmetric(horizontal: 6.0),
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: accentOrange.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(defaultImage),
                radius: 30,
              ),
              _BidDetails(bid: bid),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: tertiaryOrange,
                        onPrimary: tertiaryOrange,
                        primary: tertiaryOrange,
                        onSurface: tertiaryOrange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    onPressed: null,
                    child: Text(
                      "ACCEPT",
                      style: TextStyle(color: Colors.white),
                    )),
              )
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Bidder: ' + bid.user.username.toUpperCase(),
              style: containerCaptions),
          Text(
            'Kilograms: ' + bid.kilograms.toString(),
            style: containerCaptions,
          ),
          Text(
            'Price per Kilo: ' + bid.bidPrice.toString(),
            style: containerCaptions,
          ),
        ],
      ),
    );
  }
}

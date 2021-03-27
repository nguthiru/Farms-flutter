import 'package:farms/colorConstants.dart';
import 'package:farms/constants.dart';
import 'package:farms/controller/farmController.dart';
import 'package:farms/models/produce_model.dart';
import 'package:farms/network/urls.dart';
import 'package:farms/views/HomeScreen/containerHeading.dart';
import 'package:farms/views/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'HomeScreen/bidcard.dart';
import 'HomeScreen/columnHeading.dart';
import 'HomeScreen/produceCard.dart';

class HomeScreen extends StatelessWidget {
  final FarmController controller = Get.put(FarmController());
  @override
  Widget build(BuildContext context) {
    controller.produceFetch();
    Radius curve = Radius.circular(0);
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: curve)),
          backgroundColor: Color.fromRGBO(145, 244, 166, 1),
          elevation: 0,
          centerTitle: true,
          title: Logo(
            size: 24,
            color: Colors.orange,
          ),
          leading: IconButton(
            icon: SvgPicture.asset("Assets/Icons/menu.svg",
                color: Colors.black, width: 20, height: 20),
            onPressed: null,
          ),
          actions: [
            Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
              size: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: InkWell(
                onTap: null,
                child: CircleAvatar(
                    radius: 18, backgroundImage: NetworkImage(defaultImage)),
              ),
            ),
          ],
        ),
        body: HomeScreenBody());
  }
}

class HomeScreenBody extends StatelessWidget {
  final FarmController controller = Get.find<FarmController>();
  final Radius curve = Radius.circular(20);

  @override
  Widget build(BuildContext context) {
    controller.bidsFetch();
    return ListView(children: [
      Container(
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 5.0,
        ),
        height: 120,
        color: primaryGreen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text('Dashboard',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
              ],
            ),
          ],
        ),
      ),
      Expanded(
        child: Container(
          height: 180,
          padding: EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: curve),
              color: Colors.white),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColumnHeading(
                      head: "My produce",
                    ),
                    Container(
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ListView.builder(
                          itemCount: controller.produces.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ProduceCard(
                                produce: controller.produces[index]);
                          },
                        ),
                      ),
                    ),
                    ColumnHeading(head: "Recents Bids"),
                  ])),
        ),
      ),
      Expanded(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
          child: Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.bids.length,
              itemBuilder: (context, index) {
                return BidCard(bid: controller.bids[index]);
              },
            ),
          ),
        ),
      )
    ]);
  }
}

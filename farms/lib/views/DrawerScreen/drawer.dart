import 'package:farms/colorConstants.dart';
import 'package:farms/controller/farmController.dart';
import 'package:farms/views/DrawerScreen/drawerItems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatelessWidget {
  final String page;
  final FarmController controller = Get.find<FarmController>();

  DrawerScreen({Key key, this.page}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 10, left: 5),
      color: primaryGreen,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(controller.user.logo),
                  radius: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.user.name.toUpperCase(),
                          style: TextStyle(
                              color: backgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(controller.user.city,
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
                children: drawerItems
                    .map(
                      (element) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 8),
                        child: InkWell(
                          onTap: element['press'],
                          child: Row(
                            children: [
                              Icon(
                                element['icon'],
                                color: element['title'] == page
                                    ? Colors.white
                                    : Colors.grey,
                                size: 25,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(element['title'],
                                  style: TextStyle(
                                      color: element['title'] == page
                                          ? Colors.white
                                          : Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18))
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList()),
            Row(
              children: [
                Icon(Icons.exit_to_app, color: Colors.white),
                Text(
                  "Log Out",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            )
          ]),
    );
  }
}

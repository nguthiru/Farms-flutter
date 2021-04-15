import 'package:farms/colorConstants.dart';
import 'package:farms/controller/farmController.dart';
import 'package:farms/controller/navigationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'appBar.dart';
import 'bidcard.dart';
import 'columnHeading.dart';
import 'produceCard.dart';
import 'quickButtons.dart';
import 'searchBox.dart';

class HomeScreenBody extends StatelessWidget {
  final FarmController controller = Get.find<FarmController>();
  final NavigationController navigationController =
      Get.find<NavigationController>();
  final Radius curve = Radius.circular(20);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    controller.bidsFetch();
    controller.produceFetch();
    return Obx(() => AnimatedContainer(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(
                  navigationController.scaleFactor.value != 1.0 ? 40 : 0)),
          duration: Duration(milliseconds: 250),
          transform: Matrix4.translationValues(
              navigationController.xOffset.value,
              navigationController.yOffset.value,
              0)
            ..scale(navigationController.scaleFactor.value)
            ..rotateY(navigationController.scaleFactor.value != 1.0 ? -0.8 : 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  controller: controller,
                  navigationController: navigationController,
                ),
                Container(
                  color: backgroundColor,
                  height: size.height * 0.15,
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: size.height * 0.10,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(bottom: curve),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: SearchBox(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            QuickButtons(
                                icon: Icons.table_chart_outlined, hint: 'Bids'),
                            QuickButtons(
                                icon: Icons.add_outlined, hint: 'Produce'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 12.0),
                  child: Headings(head: 'My Produce', press: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Container(
                    height: 161,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.produces.length > 5
                            ? 5
                            : controller.produces.length,
                        itemBuilder: (context, index) {
                          return ProduceCard(
                              produce: controller.produces[index]);
                        }),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                  child: Headings(
                    head: "Recent Bids",
                    press: () {},
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.produces.length > 5
                          ? 5
                          : controller.produces.length,
                      itemBuilder: (context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: BidCard(bid: controller.bids[index]),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}

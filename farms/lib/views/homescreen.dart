import 'package:farms/colorConstants.dart';
import 'package:farms/constants.dart';
import 'package:farms/controller/farmController.dart';
import 'package:farms/controller/navigationController.dart';
import 'package:farms/models/produce_model.dart';
import 'package:farms/network/urls.dart';
import 'package:farms/views/DrawerScreen/drawer.dart';
import 'package:farms/views/HomeScreen/containerHeading.dart';
import 'package:farms/views/HomeScreen/dashboard.dart';
import 'package:farms/views/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'HomeScreen/bidcard.dart';
import 'HomeScreen/columnHeading.dart';
import 'HomeScreen/produceCard.dart';
import 'HomeScreen/quickButtons.dart';
import 'HomeScreen/searchBox.dart';

class HomeScreen extends StatelessWidget {
  final FarmController controller = Get.put(FarmController());
  final NavigationController navigator = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    controller.produceFetch();
    Radius curve = Radius.circular(0);
    return Scaffold(
        body: SafeArea(
            child: Stack(
                children: [DrawerScreen(page: 'dash'), HomeScreenBody()])));
  }
}

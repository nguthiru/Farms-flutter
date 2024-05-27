import 'package:farms/controller/farmController.dart';
import 'package:farms/controller/navigationController.dart';
import 'package:farms/views/DrawerScreen/drawer.dart';
import 'package:farms/views/HomeScreen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  final FarmController controller = Get.put(FarmController());
  final NavigationController navigator = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    controller.produceFetch();
    return Scaffold(
        body: SafeArea(
            child: Stack(
                children: [DrawerScreen(page: 'dash'), HomeScreenBody()])));
  }
}

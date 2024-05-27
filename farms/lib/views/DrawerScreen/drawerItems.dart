import 'package:farms/views/HomeScreen/dashboard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

List<Map> drawerItems = [
  {
    'icon': FontAwesomeIcons.home,
    'title': 'Dashboard',
    'press': Get.to(() => HomeScreenBody())
  },
  {'icon': FontAwesomeIcons.tree, 'title': 'Produce'},
  {'icon': FontAwesomeIcons.addressBook, 'title': 'Bids'},
  {'icon': FontAwesomeIcons.chartBar, 'title': 'Statistics'},
  {'icon': FontAwesomeIcons.questionCircle, 'title': 'Help'},
];

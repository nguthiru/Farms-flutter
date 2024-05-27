import 'package:farms/colorConstants.dart';
import 'package:farms/controller/farmController.dart';
import 'package:farms/controller/navigationController.dart';
import 'package:farms/views/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    @required this.controller,
    this.navigationController,
  }) : super(key: key);

  final FarmController controller;
  final NavigationController navigationController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        navigationController.scaleFactor.value == 1.0
            ? IconButton(
                icon: SvgPicture.asset("Assets/Icons/menu.svg",
                    color: Colors.black, width: 20, height: 20),
                onPressed: () {
                  navigationController.xOffset.value = 230.0;
                  navigationController.yOffset.value = 150.0;
                  navigationController.scaleFactor.value = 0.6;
                },
              )
            : IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {
                  navigationController.xOffset.value = 0;
                  navigationController.yOffset.value = 0;
                  navigationController.scaleFactor.value = 1;
                },
              ),
        Logo(
          size: 20,
          color: accentOrange,
        ),
        Row(
          children: [
            Icon(
              Icons.notifications_outlined,
              color: primaryGreen,
              size: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: InkWell(
                onTap: null,
                child: CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(controller.user.logo)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

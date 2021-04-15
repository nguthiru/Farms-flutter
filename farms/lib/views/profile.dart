import 'package:farms/colorConstants.dart';
import 'package:farms/controller/farmController.dart';
import 'package:farms/network/urls.dart';
import 'package:farms/views/Registration/button.dart';
import 'package:farms/views/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Profile/fields.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Get.to(() => HomeScreen()),
        ),
        backgroundColor: Colors.grey[100],
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Create your farm",
          style: TextStyle(
            color: primaryGreen,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final FarmController controller = Get.put(FarmController());
  @override
  Widget build(BuildContext context) {
    Radius curve = Radius.circular(30);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: curve,
            topRight: curve,
          ),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onDoubleTap: controller.chooseImage,
                      child: CircleAvatar(
                          radius: 30,
                          backgroundImage: controller.file == null
                              ? NetworkImage(controller.user != null
                                  ? controller.user.logo
                                  : defaultImage)
                              : FileImage(controller.file)),
                    )),
                Text("Logo",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15))
              ],
            ),
          ),
          CustomInputFields(
            icon: null,
            supportingText: "Mavuno Mengi",
            controller: controller.name,
            hintText: "Farm Name",
          ),
          CustomInputFields(
            supportingText: "Nanyuki",
            controller: controller.city,
            hintText: "Location",
          ),
          Center(
            child: CustomButton(
                hintText: "UPDATE FARM",
                press: () {
                  controller.farmUpdate;
                  Get.to(() => HomeScreen());
                }),
          )
        ],
      ),
    );
  }
}

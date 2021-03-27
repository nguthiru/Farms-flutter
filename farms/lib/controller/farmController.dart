import 'dart:io';

import 'package:farms/models/user_intermediate.dart';
import 'package:farms/models/user_model.dart';
import 'package:farms/network/constants.dart';
import 'package:farms/network/farm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class FarmController extends GetxController {
  RxList user = List(1).obs;
  File file;
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  RxString errors = ''.obs;

  @override
  void onInit() {
    farmFetch();
    // TODO: implement onReady
    super.onInit();
  }

  bool validateStatus(http.Response response) {
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  void farmFetch() async {
    http.Response response = await fetch(userFetchUrl);
    if (validateStatus(response)) {
      //TODO: Implement persistence
      UserFarm usr = userFarmFromJson(response.body);

      name.text = usr.farm.name;
      city.text = usr.farm.city;
      user.add(usr);
    } else {
      errors.value = "Error Getting Details";
    }
  }

  void validation(http.Response response) {
    print(response.body);
    if (response.statusCode == 200) {
      //TODO:Update User details in database
      UserFarm usr = userFarmFromJson(response.body);
      print(usr.farm.name);
      user.add(usr);
    } else {
      errors.value = "An error has occured";
    }
  }

  void chooseImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image.path);
    } else {
      errors.value = 'No image selected';
    }
  }

  void farmUpdate() async {
    if ((name.text != '' || name.text != null) &&
        (city.text != '' || city.text != null)) {
      http.Response response =
          await farmPatch(image: file, farmname: name.text, city: city.text);
      validation(response);
      print(response.body);
    } else {
      errors.value = 'Some Fields are empty';
    }
  }

  void produceFetch() async {}
}
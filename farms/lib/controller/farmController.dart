import 'dart:io';

import 'package:farms/models/bidsModel.dart';
import 'package:farms/models/produce_model.dart';
import 'package:farms/models/user_intermediate.dart';
import 'package:farms/models/user_model.dart';
import 'package:farms/network/urls.dart';
import 'package:farms/network/farm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class FarmController extends GetxController {
  Farm user;
  File file;
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  RxString errors = ''.obs;
  RxList produces = [].obs;
  RxList bids = [].obs;

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
      errors.value = 'An error has occured';
      return false;
    }
  }

  void farmFetch() async {
    http.Response response = await fetch(userFetchUrl);
    if (validateStatus(response)) {
      //TODO: Implement persistence
      Farm usr = farmFromJson(response.body, farmOnly: true);
      name.text = usr.name;
      city.text = usr.city;

      user = usr;
    } else {
      errors.value = "Error Getting Details";
    }
  }

  void validation(http.Response response) {
    if (validateStatus(response)) {
      print(response.body);
      //TODO:Update User details in database
      Farm usr = farmFromJson(response.body);
      print(usr.name);
      user = usr;
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

  void produceFetch() async {
    http.Response response = await fetch(produceListUrl);
    print(response.body);
    if (validateStatus(response)) {
      List<Produce> produce = produceFromJson(response.body);

      produces.assignAll(produce);
    }
  }

  void bidsFetch() async {
    http.Response response = await fetch(bidsListUrl);
    print(response.body);
    if (validateStatus(response)) {
      List<Bids> bidsList = bidsFromJson(response.body);
      bids.assignAll(bidsList);
    }
  }
}

import 'package:farms/models/user_model.dart';
import 'package:farms/network/accounts.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AccountController extends GetxController {
  RxList user = List(1).obs;
  RxString errors = ''.obs;
  SharedPreferences prefs;

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController phone = TextEditingController();
  void sharedprefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void onInit() {
    sharedprefs();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    username.dispose();
    email.dispose();
    password1.dispose();
    password2.dispose();
    phone.dispose();
    super.dispose();
  }

  void updateToken(token) {
    prefs.setString('token', token);
  }

  void validation(http.Response response) {
    print(response.body);
    if (response.statusCode == 200) {
      User usr = userFromJson(response.body);
      user.add(usr);

      //add Token to database
      updateToken(usr.token);
    } else {
      if (response.statusCode == 400) {
        errors.value = "User already exists";
      }
    }
  }

  void register() async {
    if (password1.text == password2.text) {
      http.Response response = await registerApi(
        username: username.text,
        email: email.text,
        password1: password1.text,
        password2: password2.text,
        phone: phone.text,
      );
      validation(response);
    } else {
      errors.value = "Passwords dont Match";
    }
  }

  void login() async {
    http.Response response = await loginApi(
      email: email.text,
      password: password1.text,
    );
    validation(response);
  }
}

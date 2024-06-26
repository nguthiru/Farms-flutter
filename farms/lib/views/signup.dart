import 'package:farms/colorConstants.dart';
import 'package:farms/controller/accounts.dart';
import 'package:farms/views/Registration/line.dart';
import 'package:farms/views/login.dart';
import 'package:farms/views/logo.dart';
import 'package:farms/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Registration/Fields.dart';
import 'Registration/button.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AccountController controller = Get.put(AccountController());
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(color: Colors.white),
          ),
          Obx(
            () => controller.loading.value
                ? Container(
                    child: CircularProgressIndicator(
                      backgroundColor: accentOrange,
                      valueColor: AlwaysStoppedAnimation(accentOrange),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 6.0),
                        child: Logo(
                          size: 38,
                        ),
                      ),
                      Center(
                          child: Column(
                        children: [
                          Text(
                            "Register",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          LineContainer(height: 3, width: 60)
                        ],
                      )),
                      SizedBox(height: 8.0),
                      Container(
                          margin: EdgeInsets.all(5.0),
                          height: 40,
                          child: Row(
                            children: [
                              controller.errors.value != ''
                                  ? Text("Error:    ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.red,
                                      ))
                                  : SizedBox.shrink(),
                              Text(controller.errors.value,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red,
                                  ))
                            ],
                          )),
                      InputContainer(
                        hintText: "Email Address",
                        icon: Icons.mail_outline,
                        controller: controller.email,
                      ),
                      InputContainer(
                          hintText: "Username",
                          icon: Icons.person_outline,
                          controller: controller.username),
                      InputContainer(
                          hintText: "Phone Number",
                          icon: Icons.phone_outlined,
                          controller: controller.phone),
                      InputContainer(
                        hintText: "Password",
                        icon: Icons.lock_outline,
                        controller: controller.password1,
                      ),
                      InputContainer(
                        hintText: "Confirm Password",
                        icon: Icons.lock_outline,
                        controller: controller.password2,
                      ),
                      SizedBox(height: 6),
                      Center(
                          child: CustomButton(
                        press: () {
                          controller.register();
                          if (controller.errors.value != '') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()));
                          }
                        },
                        hintText: "REGISTER",
                      )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Have an Account?",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      Center(
                        child: CustomButton(
                          press: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login())),
                          hintText: "LOGIN",
                        ),
                      )
                    ],
                  )),
          )
        ],
      ),
    );
  }
}

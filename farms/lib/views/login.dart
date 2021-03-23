import 'package:farms/controller/accounts.dart';
import 'package:farms/views/Registration/line.dart';
import 'package:farms/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'Registration/Fields.dart';
import 'Registration/button.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Farms",
                        style: TextStyle(
                            fontSize: 38, fontWeight: FontWeight.bold)),
                    SvgPicture.asset("Assets/Icons/leaf.svg",
                        color: Colors.green, width: 18, height: 18),
                  ],
                ),
              ),
              Center(
                  child: Column(
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  LineContainer(height: 3, width: 60)
                ],
              )),
              SizedBox(height: 8.0),
              InputContainer(
                hintText: "Email Address",
                icon: Icons.mail_outline,
                controller: controller.email,
              ),
              InputContainer(
                hintText: "Password",
                icon: Icons.lock_outline,
                controller: controller.password1,
              ),
              SizedBox(height: 6),
              Center(
                  child: CustomButton(
                press: controller.login,
                hintText: "LOGIN",
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Don't Have an Account?",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Center(
                child: CustomButton(
                  press: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp())),
                  hintText: "REGISTER",
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

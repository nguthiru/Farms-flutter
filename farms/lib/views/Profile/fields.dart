import 'package:farms/colorConstants.dart';
import 'package:farms/views/Registration/Fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomInputFields extends StatelessWidget {
  final String hintText;
  final String supportingText;
  final IconData icon;
  final TextEditingController controller;

  const CustomInputFields(
      {Key key, this.hintText, this.icon, this.controller, this.supportingText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(hintText + '*',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
            // Text(supportingText,
            //     style: TextStyle(
            //         fontWeight: FontWeight.w600,
            //         color: tertiaryOrange,
            //         fontSize: 14)),
            InputContainer(
              supportingText: supportingText,
              hintText: hintText,
              icon: null,
              controller: controller,
            )
          ],
        ));
  }
}

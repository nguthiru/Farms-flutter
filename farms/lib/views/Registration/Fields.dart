import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  const InputContainer({Key key, this.hintText, this.icon, this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black54,
              width: 1.85,
            ),
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[100]),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.orange[400]),
              border: InputBorder.none,
              icon: Icon(
                icon,
                color: Colors.green[300],
              )),
        ),
      ),
    );
  }
}

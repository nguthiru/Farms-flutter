import 'package:farms/colorConstants.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 1.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: primaryGreen,
            size: 20,
          ),
          SizedBox(width: 20),
          Expanded(
              child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(fontSize: 15, color: primaryGreen)),
          ))
        ],
      ),
    );
  }
}

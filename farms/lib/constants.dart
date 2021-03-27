import 'package:farms/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> returnToken() async {
  final prefs = await SharedPreferences.getInstance();

  return prefs.getString('token');
}

const TextStyle columnHeading =
    TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);

const TextStyle columnHeadingAlt =
    TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black);

const TextStyle columnSubheading = TextStyle(
    fontSize: 13, fontWeight: FontWeight.w600, color: Colors.blueGrey);

const TextStyle containerCaptions =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87);

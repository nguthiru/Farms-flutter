import 'dart:io';

import 'package:farms/constants.dart';
import 'package:farms/network/urls.dart';
import 'package:http/http.dart' as http;

Future<String> fetchToken() async {
  String token = await returnToken();

  token = 'Token ' + token;
  return token;
}

Future<http.Response> farmPatch(
    {File image, String farmname, String city}) async {
  String token = await fetchToken();

  var request = http.MultipartRequest("PATCH", Uri.parse(farmEditUrl));
  request.fields['farmName'] = farmname;
  request.fields['city'] = city;
  var pic = await http.MultipartFile.fromPath("logo", image.path);
  request.files.add(pic);
  request.headers['Authorization'] = token;
  var response = await request.send();

  var responseString = await http.Response.fromStream(response);

  return responseString;
}

Future<http.Response> fetch(endpoint) async {
  String token = await fetchToken();
  http.Response response =
      await http.get(Uri.parse(endpoint), headers: {'Authorization': token});

  return response;
}

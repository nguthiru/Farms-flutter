import 'dart:convert';
import 'dart:io';

Map<String, String> processImage(File image) {
  String fileName = image.path.split('/').last;
  String base64Image = base64Encode(image.readAsBytesSync());

  return {'fileName': fileName, 'base64Image': base64Image};
}

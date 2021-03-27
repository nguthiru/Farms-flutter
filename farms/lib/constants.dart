import 'package:shared_preferences/shared_preferences.dart';

Future<String> returnToken() async {
  final prefs = await SharedPreferences.getInstance();

  return prefs.getString('token');
}

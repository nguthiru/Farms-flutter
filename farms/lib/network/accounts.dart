import 'package:farms/network/urls.dart';
import 'package:http/http.dart' as http;

Future<http.Response> registerApi(
    {String username,
    String email,
    String password1,
    String password2,
    String phone}) async {
  Map<String, String> body = {
    'email': email,
    'username': username,
    'password': password1,
    'phone': phone,
    'usertype': 'F',
  };

  http.Response response = await http.post(Uri.parse(registerUrl), body: body);
  return response;
}

Future<http.Response> loginApi({
  String email,
  String password,
}) async {
  Map<String, String> body = {
    'username': email,
    'password': password,
  };

  http.Response response = await http.post(Uri.tryParse(loginUrl), body: body);
  return response;
}

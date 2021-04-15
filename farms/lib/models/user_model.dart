import 'dart:convert';

import 'user_intermediate.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.expiry,
    this.token,
    this.user,
  });

  DateTime expiry;
  String token;
  UserClass user;

  factory User.fromJson(Map<String, dynamic> json) => User(
        expiry: DateTime.parse(json["expiry"]),
        token: json["token"],
        user: UserClass.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "expiry": expiry.toIso8601String(),
        "token": token,
        "user": user.toJson(),
      };
}

class UserClass {
  UserClass({
    this.username,
    this.id,
    this.email,
    this.usertype,
    this.farm,
  });

  String username;
  int id;
  String email;
  String usertype;
  Farm farm;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        username: json["username"],
        id: json["id"],
        email: json["email"],
        usertype: json["usertype"],
        farm: Farm.fromJson(json["farm"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "id": id,
        "email": email,
        "usertype": usertype,
        "farm": farm.toJson(),
      };
}

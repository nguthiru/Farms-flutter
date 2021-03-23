import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.user,
    this.token,
  });

  UserClass user;
  String token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        user: UserClass.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class UserClass {
  UserClass({
    this.username,
    this.id,
    this.email,
    this.usertype,
  });

  String username;
  int id;
  String email;
  String usertype;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        username: json["username"],
        id: json["id"],
        email: json["email"],
        usertype: json["usertype"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "id": id,
        "email": email,
        "usertype": usertype,
      };
}

import 'dart:convert';

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

class Farm {
  Farm({
    this.id,
    this.name,
    this.logo,
    this.city,
    this.dateJoined,
    this.user,
  });

  int id;
  String name;
  String logo;
  String city;
  DateTime dateJoined;
  int user;

  factory Farm.fromJson(Map<String, dynamic> json) => Farm(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        city: json["city"],
        dateJoined: DateTime.parse(json["date_joined"]),
        user: json["User"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "city": city,
        "date_joined": dateJoined.toIso8601String(),
        "User": user,
      };
}

import 'dart:convert';

import 'package:farms/models/produce_model.dart';

List<Bids> bidsFromJson(String str) =>
    List<Bids>.from(json.decode(str)['results'].map((x) => Bids.fromJson(x)));

String bidsToJson(List<Bids> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bids {
  Bids({
    this.id,
    this.total,
    this.kilograms,
    this.bidPrice,
    this.accepted,
    this.user,
    this.produce,
  });

  int id;
  int total;
  int kilograms;
  int bidPrice;
  bool accepted;
  User user;
  Produce produce;

  factory Bids.fromJson(Map<String, dynamic> json) => Bids(
        id: json["id"],
        total: json["total"],
        kilograms: json["kilograms"],
        bidPrice: json["bidPrice"],
        accepted: json["accepted"],
        user: User.fromJson(json["user"]),
        produce: Produce.fromJson(json["produce"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total": total,
        "kilograms": kilograms,
        "bidPrice": bidPrice,
        "accepted": accepted,
        "user": user.toJson(),
        "produce": produce.toJson(),
      };
}

class User {
  User({
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
  dynamic farm;

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        id: json["id"],
        email: json["email"],
        usertype: json["usertype"],
        farm: json["farm"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "id": id,
        "email": email,
        "usertype": usertype,
        "farm": farm,
      };
}

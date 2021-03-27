// To parse this JSON data, do
//
//     final produce = produceFromJson(jsonString);

import 'dart:convert';

List<Produce> produceFromJson(String str) => List<Produce>.from(
    json.decode(str)['results'].map((x) => Produce.fromJson(x)));

String produceToJson(List<Produce> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Produce {
  Produce({
    this.id,
    this.product,
    this.varietyName,
    this.kilograms,
    this.image,
    this.least,
    this.price,
    this.dateAdded,
    this.baseproduct,
    this.variety,
  });

  int id;
  String product;
  String varietyName;
  int kilograms;
  String image;
  int least;
  int price;
  DateTime dateAdded;
  int baseproduct;
  int variety;

  factory Produce.fromJson(Map<String, dynamic> json) => Produce(
        id: json["id"],
        product: json["product"],
        varietyName: json["variety_name"],
        kilograms: json["kilograms"],
        image: json["image"],
        least: json["least"],
        price: json["price"],
        dateAdded: DateTime.parse(json["date_added"]),
        baseproduct: json["baseproduct"],
        variety: json["variety"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product,
        "variety_name": varietyName,
        "kilograms": kilograms,
        "image": image,
        "least": least,
        "price": price,
        "date_added": dateAdded.toIso8601String(),
        "baseproduct": baseproduct,
        "variety": variety,
      };
}

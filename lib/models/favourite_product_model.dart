// To parse this JSON data, do
//
//     final favouriteproductModel = favouriteproductModelFromJson(jsonString);

import 'dart:convert';

FavouriteproductModel? favouriteproductModelFromJson(String str) =>
    FavouriteproductModel.fromJson(json.decode(str));

String favouriteproductModelToJson(FavouriteproductModel? data) =>
    json.encode(data!.toJson());

class FavouriteproductModel {
  FavouriteproductModel({
    this.favouriteproductCategory,
    this.favouriteproductDescription,
    this.favouriteproductId,
    this.favouriteproductImages,
    this.favouriteproductName,
    this.favouriteproductPrice,
  });

  String? favouriteproductCategory;
  String? favouriteproductDescription;
  String? favouriteproductId;
  List<String?>? favouriteproductImages;
  String? favouriteproductName;
  int? favouriteproductPrice;

  factory FavouriteproductModel.fromJson(Map<String, dynamic> json) =>
      FavouriteproductModel(
        favouriteproductCategory: json["FavouriteproductCategory"],
        favouriteproductDescription: json["FavouriteproductDescription"],
        favouriteproductId: json["FavouriteproductId"],
        favouriteproductImages: json["FavouriteproductImages"] == null
            ? []
            : List<String?>.from(json["FavouriteproductImages"]!.map((x) => x)),
        favouriteproductName: json["FavouriteproductName"],
        favouriteproductPrice: json["FavouriteproductPrice"],
      );

  Map<String, dynamic> toJson() => {
        "FavouriteproductCategory": favouriteproductCategory,
        "FavouriteproductDescription": favouriteproductDescription,
        "FavouriteproductId": favouriteproductId,
        "FavouriteproductImages": favouriteproductImages == null
            ? []
            : List<dynamic>.from(favouriteproductImages!.map((x) => x)),
        "FavouriteproductName": favouriteproductName,
        "FavouriteproductPrice": favouriteproductPrice,
      };
}

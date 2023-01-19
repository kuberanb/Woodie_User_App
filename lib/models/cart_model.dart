// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.id = '',
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productQuantity,
  });

  String id;
  String productName;
  String productImage;
  int productPrice;
  int productQuantity;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        productName: json["productName"],
        productImage: json["productImage"],
        productPrice: json["productPrice"],
        productQuantity: json["productQuantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "productImage": productImage,
        "productPrice": productPrice,
        "productQuantity": productQuantity,
      };
}

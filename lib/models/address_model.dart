
// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) => AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
    AddressModel({
        required this.id,
        required this.fullName,
        required this.pincode,
        required this.state,
        required this.city,
        required this.hName,
        required this.rName,
    });

    String id;
    String fullName;
    int pincode;
    String state;
    String city;
    String hName;
    String rName;

    factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["id"],
        fullName: json["fullName"],
        pincode: json["pincode"],
        state: json["state"],
        city: json["city"],
        hName: json["hName"],
        rName: json["rName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "pincode": pincode,
        "state": state,
        "city": city,
        "hName": hName,
        "rName": rName,
    };
}

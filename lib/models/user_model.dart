// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel? userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel? data) => json.encode(data!.toJson());

class UserModel {
    UserModel({
        this.userFullName,
        this.userEmail,
        this.userId,
        this.userphoneNumber,
        this.userPassword,
    });

    String? userFullName;
    String? userEmail;
    String? userId;
    int? userphoneNumber;
    String? userPassword;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userFullName: json["userFullName"],
        userEmail: json["userEmail"],
        userId: json["userId"],
        userphoneNumber: json["userphoneNumber"],
        userPassword: json["userPassword"],
    );

    Map<String, dynamic> toJson() => {
        "userFullName": userFullName,
        "userEmail": userEmail,
        "userId": userId,
        "userphoneNumber": userphoneNumber,
        "userPassword": userPassword,
    };
}


// To parse this JSON data, do
//
//     final profilePictureModel = profilePictureModelFromJson(jsonString);

import 'dart:convert';

ProfilePictureModel profilePictureModelFromJson(String str) => ProfilePictureModel.fromJson(json.decode(str));

String profilePictureModelToJson(ProfilePictureModel data) => json.encode(data.toJson());

class ProfilePictureModel {
    ProfilePictureModel({
        required this.imageUrl,
    });

    String imageUrl;

    factory ProfilePictureModel.fromJson(Map<String, dynamic> json) => ProfilePictureModel(
        imageUrl: json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
    };
}

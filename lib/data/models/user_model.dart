import 'package:flutter/material.dart';

class UserModel{
  String name;
  String username;
  String id;

  UserModel({
    @required this.name,
    @required this.username,
    @required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      username: json["username"],
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "username": this.username,
      "id": this.id,
    };
  }
}
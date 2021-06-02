import 'package:flutter/material.dart';

class UserModel{
  String name;
  String username;
  String id;
  String email;
  String token;

  UserModel({
    @required this.name,
    @required this.username,
    @required this.id,
    @required this.email,
    this.token
  });

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "username": this.username,
      "id": this.id,
      "email": this.email,
      "token": this.token,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      username: json["username"],
      id: json["id"],
      email: json["email"],
      token: json["token"],
    );
  }
//

}
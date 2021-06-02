// To parse this JSON data, do
//
//     final responseLoginUserModel = responseLoginUserModelFromJson(jsonString);

import 'dart:convert';

ResponseLoginUserModel responseLoginUserModelFromJson(String str) => ResponseLoginUserModel.fromJson(json.decode(str));

String responseLoginUserModelToJson(ResponseLoginUserModel data) => json.encode(data.toJson());

class ResponseLoginUserModel {
  ResponseLoginUserModel({
    this.iss,
    this.data,
  });

  String iss;
  Data data;

  factory ResponseLoginUserModel.fromJson(Map<String, dynamic> json) => ResponseLoginUserModel(
    iss: json["iss"] == null ? null : json["iss"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "iss": iss == null ? null : iss,
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.noHp,
    this.username,
    this.email,
    this.role,
  });

  int id;
  String name;
  String noHp;
  String username;
  String email;
  String role;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    noHp: json["no_hp"] == null ? null : json["no_hp"],
    username: json["username"] == null ? null : json["username"],
    email: json["email"] == null ? null : json["email"],
    role: json["role"] == null ? null : json["role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "no_hp": noHp == null ? null : noHp,
    "username": username == null ? null : username,
    "email": email == null ? null : email,
    "role": role == null ? null : role,
  };
}

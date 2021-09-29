// To parse this JSON data, do
//
//     final tanding = tandingFromJson(jsonString);

import 'dart:convert';

Tanding tandingFromJson(String str) => Tanding.fromJson(json.decode(str));

String tandingToJson(Tanding data) => json.encode(data.toJson());

class Tanding {
  Tanding({
    this.status,
    this.data,
  });

  String status;
  List<List<Datum>> data;

  factory Tanding.fromJson(Map<String, dynamic> json) => Tanding(
    status: json["status"],
    data: List<List<Datum>>.from(json["data"].map((x) => List<Datum>.from(x.map((x) => Datum.fromJson(x))))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
  };
}

class Datum {
  Datum({
    this.tanding,
    this.user,
  });

  TandingClass tanding;
  User user;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    tanding: TandingClass.fromJson(json["tanding"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "tanding": tanding.toJson(),
    "user": user.toJson(),
  };
}

class TandingClass {
  TandingClass({
    this.idTanding,
    this.userId,
    this.tglTanding,
    this.userIdLawan,
    this.status,
    this.createdAt,
  });

  int idTanding;
  int userId;
  DateTime tglTanding;
  dynamic userIdLawan;
  int status;
  DateTime createdAt;

  factory TandingClass.fromJson(Map<String, dynamic> json) => TandingClass(
    idTanding: json["id_tanding"],
    userId: json["user_id"],
    tglTanding: DateTime.parse(json["tgl_tanding"]),
    userIdLawan: json["user_id_lawan"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id_tanding": idTanding,
    "user_id": userId,
    "tgl_tanding": tglTanding.toIso8601String(),
    "user_id_lawan": userIdLawan,
    "status": status,
    "created_at": createdAt.toIso8601String(),
  };
}

class User {
  User({
    this.id,
    this.username,
    this.name,
    this.noHp,
    this.authKey,
    this.passwordHash,
    this.passwordResetToken,
    this.email,
    this.userDetailId,
    this.role,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String username;
  String name;
  String noHp;
  String authKey;
  String passwordHash;
  dynamic passwordResetToken;
  String email;
  dynamic userDetailId;
  String role;
  int status;
  int createdAt;
  int updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    name: json["name"],
    noHp: json["no_hp"],
    authKey: json["auth_key"],
    passwordHash: json["password_hash"],
    passwordResetToken: json["password_reset_token"],
    email: json["email"],
    userDetailId: json["user_detail_id"],
    role: json["role"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "name": name,
    "no_hp": noHp,
    "auth_key": authKey,
    "password_hash": passwordHash,
    "password_reset_token": passwordResetToken,
    "email": email,
    "user_detail_id": userDetailId,
    "role": role,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

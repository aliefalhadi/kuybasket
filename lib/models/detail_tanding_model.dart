// To parse this JSON data, do
//
//     final detailTandingModel = detailTandingModelFromJson(jsonString);

import 'dart:convert';

DetailTandingModel detailTandingModelFromJson(String str) => DetailTandingModel.fromJson(json.decode(str));

String detailTandingModelToJson(DetailTandingModel data) => json.encode(data.toJson());

class DetailTandingModel {
  DetailTandingModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory DetailTandingModel.fromJson(Map<String, dynamic> json) => DetailTandingModel(
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.tanding,
    this.user,
    this.lawan,
  });

  TandingDetail tanding;
  User user;
  List<Lawan> lawan;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    tanding: json["tanding"] == null ? null : TandingDetail.fromJson(json["tanding"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    lawan: json["lawan"] == null ? null : List<Lawan>.from(json["lawan"].map((x) => Lawan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "tanding": tanding == null ? null : tanding.toJson(),
    "user": user == null ? null : user.toJson(),
    "lawan": lawan == null ? null : List<dynamic>.from(lawan.map((x) => x.toJson())),
  };
}

class Lawan {
  Lawan({
    this.tandingLawan,
    this.user,
  });

  TandingLawan tandingLawan;
  User user;

  factory Lawan.fromJson(Map<String, dynamic> json) => Lawan(
    tandingLawan: json["tanding_lawan"] == null ? null : TandingLawan.fromJson(json["tanding_lawan"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "tanding_lawan": tandingLawan == null ? null : tandingLawan.toJson(),
    "user": user == null ? null : user.toJson(),
  };
}

class TandingLawan {
  TandingLawan({
    this.idTandingLawan,
    this.tandingId,
    this.userId,
    this.status,
    this.createdAt,
  });

  int idTandingLawan;
  int tandingId;
  int userId;
  int status;
  DateTime createdAt;

  factory TandingLawan.fromJson(Map<String, dynamic> json) => TandingLawan(
    idTandingLawan: json["id_tanding_lawan"] == null ? null : json["id_tanding_lawan"],
    tandingId: json["tanding_id"] == null ? null : json["tanding_id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    status: json["status"] == null ? null : json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id_tanding_lawan": idTandingLawan == null ? null : idTandingLawan,
    "tanding_id": tandingId == null ? null : tandingId,
    "user_id": userId == null ? null : userId,
    "status": status == null ? null : status,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
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
  String userDetailId;
  String role;
  int status;
  int createdAt;
  int updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
    name: json["name"] == null ? null : json["name"],
    noHp: json["no_hp"] == null ? null : json["no_hp"],
    authKey: json["auth_key"] == null ? null : json["auth_key"],
    passwordHash: json["password_hash"] == null ? null : json["password_hash"],
    passwordResetToken: json["password_reset_token"],
    email: json["email"] == null ? null : json["email"],
    userDetailId: json["user_detail_id"] == null ? null : json["user_detail_id"],
    role: json["role"] == null ? null : json["role"],
    status: json["status"] == null ? null : json["status"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "username": username == null ? null : username,
    "name": name == null ? null : name,
    "no_hp": noHp == null ? null : noHp,
    "auth_key": authKey == null ? null : authKey,
    "password_hash": passwordHash == null ? null : passwordHash,
    "password_reset_token": passwordResetToken,
    "email": email == null ? null : email,
    "user_detail_id": userDetailId == null ? null : userDetailId,
    "role": role == null ? null : role,
    "status": status == null ? null : status,
    "created_at": createdAt == null ? null : createdAt,
    "updated_at": updatedAt == null ? null : updatedAt,
  };
}

class TandingDetail {
  TandingDetail({
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

  factory TandingDetail.fromJson(Map<String, dynamic> json) => TandingDetail(
    idTanding: json["id_tanding"] == null ? null : json["id_tanding"],
    userId: json["user_id"] == null ? null : json["user_id"],
    tglTanding: json["tgl_tanding"] == null ? null : DateTime.parse(json["tgl_tanding"]),
    userIdLawan: json["user_id_lawan"],
    status: json["status"] == null ? null : json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id_tanding": idTanding == null ? null : idTanding,
    "user_id": userId == null ? null : userId,
    "tgl_tanding": tglTanding == null ? null : tglTanding.toIso8601String(),
    "user_id_lawan": userIdLawan,
    "status": status == null ? null : status,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
  };
}

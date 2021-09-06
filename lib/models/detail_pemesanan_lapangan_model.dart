// To parse this JSON data, do
//
//     final detailPemesananLapanganModel = detailPemesananLapanganModelFromJson(jsonString);

import 'dart:convert';

DetailPemesananLapanganModel detailPemesananLapanganModelFromJson(String str) => DetailPemesananLapanganModel.fromJson(json.decode(str));

String detailPemesananLapanganModelToJson(DetailPemesananLapanganModel data) => json.encode(data.toJson());

class DetailPemesananLapanganModel {
  DetailPemesananLapanganModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory DetailPemesananLapanganModel.fromJson(Map<String, dynamic> json) => DetailPemesananLapanganModel(
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
    this.dataPemesanan,
    this.dataLapangan,
    this.dataUserPemesan,
    this.fotoLapangan,
    this.detailPemesanan,
  });

  DataPemesanan dataPemesanan;
  DataLapangan dataLapangan;
  DataUserPemesan dataUserPemesan;
  FotoLapangan fotoLapangan;
  List<DetailPemesanan> detailPemesanan;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    dataPemesanan: json["data_pemesanan"] == null ? null : DataPemesanan.fromJson(json["data_pemesanan"]),
    dataLapangan: json["data_lapangan"] == null ? null : DataLapangan.fromJson(json["data_lapangan"]),
    dataUserPemesan: json["data_user_pemesan"] == null ? null : DataUserPemesan.fromJson(json["data_user_pemesan"]),
    fotoLapangan: json["foto_lapangan"] == null ? null : FotoLapangan.fromJson(json["foto_lapangan"]),
    detailPemesanan: json["detail_pemesanan"] == null ? null : List<DetailPemesanan>.from(json["detail_pemesanan"].map((x) => DetailPemesanan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data_pemesanan": dataPemesanan == null ? null : dataPemesanan.toJson(),
    "data_lapangan": dataLapangan == null ? null : dataLapangan.toJson(),
    "data_user_pemesan": dataUserPemesan == null ? null : dataUserPemesan.toJson(),
    "foto_lapangan": fotoLapangan == null ? null : fotoLapangan.toJson(),
    "detail_pemesanan": detailPemesanan == null ? null : List<dynamic>.from(detailPemesanan.map((x) => x.toJson())),
  };
}

class DataLapangan {
  DataLapangan({
    this.idLapangan,
    this.pemilikId,
    this.namaLapangan,
    this.alamatLapangan,
    this.jamBuka,
    this.jamTutup,
    this.biayaPerJam,
    this.deskripsi,
    this.kontakAdmin,
    this.status,
  });

  int idLapangan;
  int pemilikId;
  String namaLapangan;
  String alamatLapangan;
  String jamBuka;
  String jamTutup;
  int biayaPerJam;
  String deskripsi;
  String kontakAdmin;
  String status;

  factory DataLapangan.fromJson(Map<String, dynamic> json) => DataLapangan(
    idLapangan: json["id_lapangan"] == null ? null : json["id_lapangan"],
    pemilikId: json["pemilik_id"] == null ? null : json["pemilik_id"],
    namaLapangan: json["nama_lapangan"] == null ? null : json["nama_lapangan"],
    alamatLapangan: json["alamat_lapangan"] == null ? null : json["alamat_lapangan"],
    jamBuka: json["jam_buka"] == null ? null : json["jam_buka"],
    jamTutup: json["jam_tutup"] == null ? null : json["jam_tutup"],
    biayaPerJam: json["biaya_per_jam"] == null ? null : json["biaya_per_jam"],
    deskripsi: json["deskripsi"] == null ? null : json["deskripsi"],
    kontakAdmin: json["kontak_admin"] == null ? null : json["kontak_admin"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id_lapangan": idLapangan == null ? null : idLapangan,
    "pemilik_id": pemilikId == null ? null : pemilikId,
    "nama_lapangan": namaLapangan == null ? null : namaLapangan,
    "alamat_lapangan": alamatLapangan == null ? null : alamatLapangan,
    "jam_buka": jamBuka == null ? null : jamBuka,
    "jam_tutup": jamTutup == null ? null : jamTutup,
    "biaya_per_jam": biayaPerJam == null ? null : biayaPerJam,
    "deskripsi": deskripsi == null ? null : deskripsi,
    "kontak_admin": kontakAdmin == null ? null : kontakAdmin,
    "status": status == null ? null : status,
  };
}

class DataPemesanan {
  DataPemesanan({
    this.idPemesananLapangan,
    this.lapanganId,
    this.userIdPemesan,
    this.tanggalPemesanan,
    this.biayaPerJam,
    this.totalBaya,
    this.status,
    this.createdAt,
    this.expiredPembayaranAt,
  });

  int idPemesananLapangan;
  int lapanganId;
  int userIdPemesan;
  DateTime tanggalPemesanan;
  int biayaPerJam;
  int totalBaya;
  String status;
  DateTime createdAt;
  DateTime expiredPembayaranAt;

  factory DataPemesanan.fromJson(Map<String, dynamic> json) => DataPemesanan(
    idPemesananLapangan: json["id_pemesanan_lapangan"] == null ? null : json["id_pemesanan_lapangan"],
    lapanganId: json["lapangan_id"] == null ? null : json["lapangan_id"],
    userIdPemesan: json["user_id_pemesan"] == null ? null : json["user_id_pemesan"],
    tanggalPemesanan: json["tanggal_pemesanan"] == null ? null : DateTime.parse(json["tanggal_pemesanan"]),
    biayaPerJam: json["biaya_per_jam"] == null ? null : json["biaya_per_jam"],
    totalBaya: json["total_baya"] == null ? null : json["total_baya"],
    status: json["status"] == null ? null : json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    expiredPembayaranAt: json["expired_pembayaran_at"] == null ? null : DateTime.parse(json["expired_pembayaran_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id_pemesanan_lapangan": idPemesananLapangan == null ? null : idPemesananLapangan,
    "lapangan_id": lapanganId == null ? null : lapanganId,
    "user_id_pemesan": userIdPemesan == null ? null : userIdPemesan,
    "tanggal_pemesanan": tanggalPemesanan == null ? null : "${tanggalPemesanan.year.toString().padLeft(4, '0')}-${tanggalPemesanan.month.toString().padLeft(2, '0')}-${tanggalPemesanan.day.toString().padLeft(2, '0')}",
    "biaya_per_jam": biayaPerJam == null ? null : biayaPerJam,
    "total_baya": totalBaya == null ? null : totalBaya,
    "status": status == null ? null : status,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "expired_pembayaran_at": expiredPembayaranAt == null ? null : expiredPembayaranAt.toIso8601String(),
  };
}

class DataUserPemesan {
  DataUserPemesan({
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

  factory DataUserPemesan.fromJson(Map<String, dynamic> json) => DataUserPemesan(
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
    name: json["name"] == null ? null : json["name"],
    noHp: json["no_hp"] == null ? null : json["no_hp"],
    authKey: json["auth_key"] == null ? null : json["auth_key"],
    passwordHash: json["password_hash"] == null ? null : json["password_hash"],
    passwordResetToken: json["password_reset_token"],
    email: json["email"] == null ? null : json["email"],
    userDetailId: json["user_detail_id"],
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
    "user_detail_id": userDetailId,
    "role": role == null ? null : role,
    "status": status == null ? null : status,
    "created_at": createdAt == null ? null : createdAt,
    "updated_at": updatedAt == null ? null : updatedAt,
  };
}

class DetailPemesanan {
  DetailPemesanan({
    this.idPemesananLapanganDetail,
    this.pemesananLapanganId,
    this.jam,
    this.createdAt,
  });

  int idPemesananLapanganDetail;
  int pemesananLapanganId;
  String jam;
  DateTime createdAt;

  factory DetailPemesanan.fromJson(Map<String, dynamic> json) => DetailPemesanan(
    idPemesananLapanganDetail: json["id_pemesanan_lapangan_detail"] == null ? null : json["id_pemesanan_lapangan_detail"],
    pemesananLapanganId: json["pemesanan_lapangan_id"] == null ? null : json["pemesanan_lapangan_id"],
    jam: json["jam"] == null ? null : json["jam"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id_pemesanan_lapangan_detail": idPemesananLapanganDetail == null ? null : idPemesananLapanganDetail,
    "pemesanan_lapangan_id": pemesananLapanganId == null ? null : pemesananLapanganId,
    "jam": jam == null ? null : jam,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
  };
}

class FotoLapangan {
  FotoLapangan({
    this.idFotoLapangan,
    this.lapanganId,
    this.foto,
    this.createdAt,
  });

  int idFotoLapangan;
  int lapanganId;
  String foto;
  DateTime createdAt;

  factory FotoLapangan.fromJson(Map<String, dynamic> json) => FotoLapangan(
    idFotoLapangan: json["id_foto_lapangan"] == null ? null : json["id_foto_lapangan"],
    lapanganId: json["lapangan_id"] == null ? null : json["lapangan_id"],
    foto: json["foto"] == null ? null : json["foto"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id_foto_lapangan": idFotoLapangan == null ? null : idFotoLapangan,
    "lapangan_id": lapanganId == null ? null : lapanganId,
    "foto": foto == null ? null : foto,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
  };
}

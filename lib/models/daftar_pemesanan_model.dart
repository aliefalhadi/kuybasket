// To parse this JSON data, do
//
//     final daftarPemesananModel = daftarPemesananModelFromJson(jsonString);

import 'dart:convert';

DaftarPemesananModel daftarPemesananModelFromJson(String str) => DaftarPemesananModel.fromJson(json.decode(str));

String daftarPemesananModelToJson(DaftarPemesananModel data) => json.encode(data.toJson());

class DaftarPemesananModel {
  DaftarPemesananModel({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory DaftarPemesananModel.fromJson(Map<String, dynamic> json) => DaftarPemesananModel(
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.data,
    this.dataLapangan,
    this.foto,
  });

  Data data;
  DataLapangan dataLapangan;
  String foto;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    dataLapangan: json["data_lapangan"] == null ? null : DataLapangan.fromJson(json["data_lapangan"]),
    foto: json["foto"] == null ? null : json["foto"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "data_lapangan": dataLapangan == null ? null : dataLapangan.toJson(),
    "foto": foto == null ? null : foto,
  };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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

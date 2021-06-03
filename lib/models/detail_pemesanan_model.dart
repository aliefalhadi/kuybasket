// To parse this JSON data, do
//
//     final detailPemesananModel = detailPemesananModelFromJson(jsonString);

import 'dart:convert';

DetailPemesananModel detailPemesananModelFromJson(String str) => DetailPemesananModel.fromJson(json.decode(str));

String detailPemesananModelToJson(DetailPemesananModel data) => json.encode(data.toJson());

class DetailPemesananModel {
  DetailPemesananModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory DetailPemesananModel.fromJson(Map<String, dynamic> json) => DetailPemesananModel(
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
    this.dataPemilik,
  });

  DataPemesanan dataPemesanan;
  DataLapangan dataLapangan;
  DataPemilik dataPemilik;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    dataPemesanan: json["data_pemesanan"] == null ? null : DataPemesanan.fromJson(json["data_pemesanan"]),
    dataLapangan: json["data_lapangan"] == null ? null : DataLapangan.fromJson(json["data_lapangan"]),
    dataPemilik: json["data_pemilik"] == null ? null : DataPemilik.fromJson(json["data_pemilik"]),
  );

  Map<String, dynamic> toJson() => {
    "data_pemesanan": dataPemesanan == null ? null : dataPemesanan.toJson(),
    "data_lapangan": dataLapangan == null ? null : dataLapangan.toJson(),
    "data_pemilik": dataPemilik == null ? null : dataPemilik.toJson(),
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

class DataPemilik {
  DataPemilik({
    this.idPemilikLapangan,
    this.nik,
    this.nama,
    this.noHp,
    this.alamat,
    this.noRek,
    this.noRekAtasNama,
    this.createdAt,
  });

  int idPemilikLapangan;
  String nik;
  String nama;
  String noHp;
  String alamat;
  String noRek;
  String noRekAtasNama;
  DateTime createdAt;

  factory DataPemilik.fromJson(Map<String, dynamic> json) => DataPemilik(
    idPemilikLapangan: json["id_pemilik_lapangan"] == null ? null : json["id_pemilik_lapangan"],
    nik: json["nik"] == null ? null : json["nik"],
    nama: json["nama"] == null ? null : json["nama"],
    noHp: json["no_hp"] == null ? null : json["no_hp"],
    alamat: json["alamat"] == null ? null : json["alamat"],
    noRek: json["no_rek"] == null ? null : json["no_rek"],
    noRekAtasNama: json["no_rek_atas_nama"] == null ? null : json["no_rek_atas_nama"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id_pemilik_lapangan": idPemilikLapangan == null ? null : idPemilikLapangan,
    "nik": nik == null ? null : nik,
    "nama": nama == null ? null : nama,
    "no_hp": noHp == null ? null : noHp,
    "alamat": alamat == null ? null : alamat,
    "no_rek": noRek == null ? null : noRek,
    "no_rek_atas_nama": noRekAtasNama == null ? null : noRekAtasNama,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
  };
}

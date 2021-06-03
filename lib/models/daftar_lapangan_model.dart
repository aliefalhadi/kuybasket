// To parse this JSON data, do
//
//     final daftarLapanganModel = daftarLapanganModelFromJson(jsonString);

import 'dart:convert';

DaftarLapanganModel daftarLapanganModelFromJson(String str) => DaftarLapanganModel.fromJson(json.decode(str));

String daftarLapanganModelToJson(DaftarLapanganModel data) => json.encode(data.toJson());

class DaftarLapanganModel {
  DaftarLapanganModel({
    this.status,
    this.data,
  });

  String status;
  List<DatumDaftarLapangan> data;

  factory DaftarLapanganModel.fromJson(Map<String, dynamic> json) => DaftarLapanganModel(
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : List<DatumDaftarLapangan>.from(json["data"].map((x) => DatumDaftarLapangan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DatumDaftarLapangan {
  DatumDaftarLapangan({
    this.dataLapangan,
    this.fotoLapangan,
  });

  DataLapangan dataLapangan;
  List<FotoLapangan> fotoLapangan;

  factory DatumDaftarLapangan.fromJson(Map<String, dynamic> json) => DatumDaftarLapangan(
    dataLapangan: json["data_lapangan"] == null ? null : DataLapangan.fromJson(json["data_lapangan"]),
    fotoLapangan: json["foto_lapangan"] == null ? null : List<FotoLapangan>.from(json["foto_lapangan"].map((x) => FotoLapangan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data_lapangan": dataLapangan == null ? null : dataLapangan.toJson(),
    "foto_lapangan": fotoLapangan == null ? null : List<dynamic>.from(fotoLapangan.map((x) => x.toJson())),
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

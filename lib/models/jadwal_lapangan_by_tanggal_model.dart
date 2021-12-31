// To parse this JSON data, do
//
//     final jadwalLapanganByTanggalModel = jadwalLapanganByTanggalModelFromJson(jsonString);

import 'dart:convert';

JadwalLapanganByTanggalModel jadwalLapanganByTanggalModelFromJson(String str) => JadwalLapanganByTanggalModel.fromJson(json.decode(str));

String jadwalLapanganByTanggalModelToJson(JadwalLapanganByTanggalModel data) => json.encode(data.toJson());

class JadwalLapanganByTanggalModel {
  JadwalLapanganByTanggalModel({
    this.status,
    this.data,
  });

  String status;
  List<DatumJadwalLapangan> data;

  factory JadwalLapanganByTanggalModel.fromJson(Map<String, dynamic> json) => JadwalLapanganByTanggalModel(
    status: json["status"],
    data: List<DatumJadwalLapangan>.from(json["data"].map((x) => DatumJadwalLapangan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DatumJadwalLapangan {
  DatumJadwalLapangan({
    this.data,
    this.status,
  });

  Data data;
  int status;

  factory DatumJadwalLapangan.fromJson(Map<String, dynamic> json) => DatumJadwalLapangan(
    data: Data.fromJson(json["data"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "status": status,
  };
}

class Data {
  Data({
    this.idJadwalJamLapangan,
    this.lapanganId,
    this.jam,
  });

  int idJadwalJamLapangan;
  int lapanganId;
  String jam;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    idJadwalJamLapangan: json["id_jadwal_jam_lapangan"],
    lapanganId: json["lapangan_id"],
    jam: json["jam"],
  );

  Map<String, dynamic> toJson() => {
    "id_jadwal_jam_lapangan": idJadwalJamLapangan,
    "lapangan_id": lapanganId,
    "jam": jam,
  };
}

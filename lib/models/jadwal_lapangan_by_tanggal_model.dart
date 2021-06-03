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
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : List<DatumJadwalLapangan>.from(json["data"].map((x) => DatumJadwalLapangan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DatumJadwalLapangan {
  DatumJadwalLapangan({
    this.idJadwalJamLapangan,
    this.lapanganId,
    this.jam,
  });

  int idJadwalJamLapangan;
  int lapanganId;
  String jam;

  factory DatumJadwalLapangan.fromJson(Map<String, dynamic> json) => DatumJadwalLapangan(
    idJadwalJamLapangan: json["id_jadwal_jam_lapangan"] == null ? null : json["id_jadwal_jam_lapangan"],
    lapanganId: json["lapangan_id"] == null ? null : json["lapangan_id"],
    jam: json["jam"] == null ? null : json["jam"],
  );

  Map<String, dynamic> toJson() => {
    "id_jadwal_jam_lapangan": idJadwalJamLapangan == null ? null : idJadwalJamLapangan,
    "lapangan_id": lapanganId == null ? null : lapanganId,
    "jam": jam == null ? null : jam,
  };
}

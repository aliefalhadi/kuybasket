import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kuybasket/models/daftar_lapangan_model.dart';
import 'package:kuybasket/models/detail_lapangan_model.dart';
import 'package:kuybasket/models/jadwal_lapangan_by_tanggal_model.dart';
import 'package:kuybasket/services/Service.dart';

class LapanganService extends Service{
  Future getDaftarLapangan() async {
    try {
      var url = '/lapangans/index';

      var response = await get(url);

      if (response.statusCode == 200) {
        DaftarLapanganModel daftarLapanganModel =
        daftarLapanganModelFromJson(jsonEncode(response.data));
        return daftarLapanganModel;
      } else {
        throw ('data tidak ditemukan');
      }
    } on SocketException catch (_) {
      throw SocketException('no_internet');
    } catch (error) {
      if (error is DioError) {
        print(error.response.statusCode);
        throw (error.response.statusCode);
      }
    }
  }

  Future getDetailLapangan(String idLapangan) async {
    try {
      var url = '/lapangans/detail-lapangan/'+idLapangan;

      var response = await get(url);

      if (response.statusCode == 200) {
        DetailLapanganModel detailLapanganModel =
        detailLapanganModelFromJson(jsonEncode(response.data));
        return detailLapanganModel;
      } else {
        throw ('data tidak ditemukan');
      }
    } on SocketException catch (_) {
      throw SocketException('no_internet');
    } catch (error) {
      if (error is DioError) {
        print(error.response.statusCode);
        throw (error.response.statusCode);
      }
    }
  }

  Future getJamKosongLapangan({String idLapangan, String tanggal}) async {
    try {
      var url = '/lapangans/jam-kosong-by-tanggal?lapangan_id='+idLapangan+'&tanggal='+tanggal;

      var response = await get(url);

      if (response.statusCode == 200) {
        JadwalLapanganByTanggalModel jadwalLapanganByTanggalModel =
        jadwalLapanganByTanggalModelFromJson(jsonEncode(response.data));
        return jadwalLapanganByTanggalModel;
      } else {
        throw ('data tidak ditemukan');
      }
    } on SocketException catch (_) {
      throw SocketException('no_internet');
    } catch (error) {
      if (error is DioError) {
        print(error.response.statusCode);
        throw (error.response.statusCode);
      }
    }
  }

  Future<Response> postPemesananLapangan(var data) async {
    try {
      var url = '/lapangans/pemesanan-lapangan';

      var response = await post(url, data);

      if (response.statusCode == 201) {
        return response;
      } else {
        throw ('data tidak ditemukan');
      }
    } on SocketException catch (_) {
      throw SocketException('no_internet');
    } catch (error) {
      if (error is DioError) {
        print(error.response.statusCode);
        throw (error.response.statusCode);
      }
    }
  }
}
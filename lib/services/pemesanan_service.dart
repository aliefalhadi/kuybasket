import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kuybasket/models/daftar_pemesanan_model.dart';
import 'package:kuybasket/models/detail_pemesanan_lapangan_model.dart';
import 'package:kuybasket/models/detail_pemesanan_model.dart';
import 'package:kuybasket/services/Service.dart';

class PemesananService extends Service{
  Future getDaftarPemesanan({String status,@required String idUser}) async {
    try {
      var url = '/lapangans/daftar-pemesanan-by-user/'+idUser+'?status='+status;

      var response = await get(url);

      if (response.statusCode == 200) {
        DaftarPemesananModel daftarPemesananModel =
        daftarPemesananModelFromJson(jsonEncode(response.data));
        return daftarPemesananModel;
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

  Future getDetailPemesanan({String idPemesanan}) async {
    try {
      var url = '/lapangans/detail-pembayaran/'+idPemesanan;

      var response = await get(url);

      if (response.statusCode == 200) {
        DetailPemesananModel detailPemesananModel =
        detailPemesananModelFromJson(jsonEncode(response.data));
        return detailPemesananModel;
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

  Future getDetailPemesananLapangan({String idPemesanan}) async {
    try {
      var url = '/lapangans/detail-pemesanan/'+idPemesanan;

      var response = await get(url);

      if (response.statusCode == 200) {
        DetailPemesananLapanganModel detailPemesananLapanganModel =
        detailPemesananLapanganModelFromJson(jsonEncode(response.data));
        return detailPemesananLapanganModel;
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

  Future postBuktiPembayaran(var data) async {
    try {
      var url = '/lapangans/upload-bukti-pembayaran';
      print(data);
      var response = await postImage(url, data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ('data tidak ditemukan');
      }
    } catch (error) {
      if(error is DioError){
        print(error.response.statusCode);
        throw(error.response.statusCode);
      }
    }
  }
}
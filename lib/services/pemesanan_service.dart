import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kuybasket/models/daftar_pemesanan_model.dart';
import 'package:kuybasket/models/detail_pemesanan_model.dart';
import 'package:kuybasket/services/Service.dart';

class PemesananService extends Service{
  Future getDaftarPemesanan({String status}) async {
    try {
      var url = '/lapangans/daftar-pemesanan-by-user/4?status='+status;

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
}
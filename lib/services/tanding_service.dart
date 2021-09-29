
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kuybasket/models/tanding_model.dart';

import 'Service.dart';

class TandingService extends Service {
  Future getTanding() async {
    try {
      var url = '/tandings/semua';

      var response = await get(url);

      if (response.statusCode == 200) {
        Tanding tandingModel = tandingFromJson(jsonEncode(response.data));
        print(tandingModel);
        return tandingModel;
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

  Future getTandingSaya(id) async {
    try {
      var url = '/tandings/saya/$id';

      var response = await get(url);

      if (response.statusCode == 200) {
        Tanding tandingModel = tandingFromJson(jsonEncode(response.data));
        print(id);
        return tandingModel;
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

  Future postBuatTanding(data) async {
    try {
      var url = '/tandings/create';

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
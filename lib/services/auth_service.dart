import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kuybasket/services/Service.dart';

class AuthService extends Service{
  Future<Response> postRegister(var data) async {
    try {
      var url = '/auths/register';

      var response = await postLogin2(url, data);

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
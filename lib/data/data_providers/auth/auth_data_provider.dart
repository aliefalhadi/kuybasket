import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kuybasket/data/data_providers/base_api.dart';

class AuthDataProvider{
  BaseAPI _baseAPI = BaseAPI();

  Future<Response> postRegisterUser(String data)async{
    log(data,name: 'data');
    Response response = await _baseAPI.post(url:'/auths/register', data: data);
    log(response.statusCode.toString(),name: 'res');
    return response;
  }
}
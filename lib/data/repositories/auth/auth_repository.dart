import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kuybasket/data/data_providers/auth/auth_data_provider.dart';
import 'package:kuybasket/data/models/ResponseLoginUserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository{
  AuthDataProvider _authDataProvider = AuthDataProvider();

  Future<ResponseLoginUserModel> postRegisterUser(var data) async{
    Response response = await _authDataProvider.postRegisterUser(data);

    if(response.statusCode == 201){
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      ResponseLoginUserModel responseLoginUserModel = responseLoginUserModelFromJson(ascii.decode(base64.decode(base64.normalize(response.data['token'].split(".")[1]))));
      sharedPreferences.setString('data_user', jsonEncode(responseLoginUserModel));
      sharedPreferences.setString('token', response.data['token']);
      sharedPreferences.setBool('isLogin', true);
      return responseLoginUserModel;
    }else{
      return null;
    }
  }

  Future<ResponseLoginUserModel> postLoginUser(var data) async{
    Response response = await _authDataProvider.postRegisterUser(data);

    if(response.statusCode == 200){
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('token', response.data['token']);

      ResponseLoginUserModel responseLoginUserModel = responseLoginUserModelFromJson(ascii.decode(base64.decode(base64.normalize(response.data['token'].split(".")[1]))));
      sharedPreferences.setString('data_user', responseLoginUserModel.toString());
      print(responseLoginUserModel.toString());
      return ResponseLoginUserModel();
    }else{
      return null;
    }
  }
}
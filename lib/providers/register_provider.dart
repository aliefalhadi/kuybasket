import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kuybasket/configs/utils/shared_preference_helper.dart';
import 'package:kuybasket/locator.dart';
import 'package:kuybasket/models/data_token_login_model.dart';
import 'package:kuybasket/providers/base_provider.dart';
import 'package:kuybasket/services/auth_service.dart';

class RegisterProvider extends BaseProvider{
  AuthService _authService = locator<AuthService>();
  Map dataRegister = {
    "name" : "",
    "email" : "",
    "no_hp" : ""
  };

  void stateChanged({String field, String value}){
    dataRegister[field] = value;
  }

  Future<bool> registerWithCredentials() async {
    try {
      Response res = await _authService.postRegister(jsonEncode(this.dataRegister));
      if(res.data != null){
        await locator<SharedPreferencesHelper>().storeValueBool('isLogin', true);
        await locator<SharedPreferencesHelper>().storeValueString('token', res.data['token']);

        DataTokenLoginModel dataTokenLoginModel = dataTokenLoginModelFromJson(ascii.decode(base64.decode(base64.normalize(res.data['token'].split(".")[1]))));
        await locator<SharedPreferencesHelper>().storeValueString('dataTokenLogin', jsonEncode(dataTokenLoginModel));

        await locator<SharedPreferencesHelper>().storeValueString('idUser', dataTokenLoginModel.data.idUser.toString());
        await locator<SharedPreferencesHelper>().storeValueString('username', dataTokenLoginModel.data.username.toString());
        await locator<SharedPreferencesHelper>().storeValueString('nama', dataTokenLoginModel.data.nama.toString());
        await locator<SharedPreferencesHelper>().storeValueString('no_hp', dataTokenLoginModel.data.noHp.toString());


        return true;
      }else{
        return false;
      }
    } on Exception catch (e) {
      // emit(state.copyWith(status: FormzStatus.submissionFailure, exceptionError: e.toString()));
      return false;
    }
  }
}
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/utils/shared_preference_helper.dart';
import 'package:kuybasket/locator.dart';
import 'package:kuybasket/models/data_token_login_model.dart';
import 'package:kuybasket/providers/base_provider.dart';
import 'package:kuybasket/services/auth_service.dart';

class RegisterProvider extends BaseProvider{
  AuthService _authService = locator<AuthService>();
  String phoneNumber, username, otp, authStatus, verificationId, password;
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

  Future sendCode(BuildContext context)async{
    this.phoneNumber = this.dataRegister['no_hp'];
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: '+$phoneNumber',
      timeout: Duration(seconds: 120),
      verificationCompleted: (AuthCredential authCredential) async{

        // user sudah pernah verified
        // lngsng alihkan ke halaman selanjutnya
        EasyLoading.show(status: "Loading");
        var res = await registerWithCredentials();
        EasyLoading.dismiss();
        if(res){
          // context.read<AuthenticationBloc>().add(AuthenticationUserLogged(responseLoginUserModel: res));
          Navigator.pushNamedAndRemoveUntil(context, AppRouterStrings.home, (route) => false);
          EasyLoading.showToast('Berhasil');
        }else{
          EasyLoading.showToast('Gagal');
        }
        // Navigator.pushReplacementNamed(context, AppRouterStrings.register);
      },
      verificationFailed: (FirebaseAuthException authException) {
        // setState(()

        print(authException);
        EasyLoading.showError(authException.message,duration: Duration(seconds: 3),dismissOnTap: true,maskType: EasyLoadingMaskType.clear);
        // });
      },
      codeSent: (String verId, [int forceCodeResent]) async{
        print('asdasd');
        verificationId = verId;
        print(verId);
        authStatus = "Kode berhasil dikirimkan ke nomor $phoneNumber";
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
        authStatus = "Waktu Habis";
        return false;
      },
    );
  }

  Future validationOtp(
      {@required String verificationId, @required String otp}) async {
    try {
      print(verificationId);
      print(otp);
      var user = await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp));

      if (user != null) {
        print("berhasil login");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

}
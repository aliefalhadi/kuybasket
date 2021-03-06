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
// import 'package:onesignal_flutter/onesignal_flutter.dart';

class LoginProvider extends BaseProvider {
  AuthService _authService = locator<AuthService>();
  Map dataRegister = {"no_hp": ""};
  FirebaseAuth authFirebase = FirebaseAuth.instance;
  PhoneAuthProvider authPhone = new PhoneAuthProvider();
  String phoneNumber, username, otp, authStatus, verificationId, password;
  // bool isFetching = false;
  // bool isCodeSent = false;
  // bool isError = false;
  // int timer = 60;
  // int percobaan = 4;
  // String errMessage;

  void stateChanged({String field, String value}) {
    dataRegister[field] = value;
  }

  Future<bool> loginWithCredentials() async {
    try {
      Response res =
          await _authService.postLogin(jsonEncode(this.dataRegister));

      if (res.data != null) {
        await locator<SharedPreferencesHelper>()
            .storeValueBool('isLogin', true);
        await locator<SharedPreferencesHelper>()
            .storeValueString('token', res.data['token']);

        DataTokenLoginModel dataTokenLoginModel = dataTokenLoginModelFromJson(
            ascii.decode(base64
                .decode(base64.normalize(res.data['token'].split(".")[1]))));
        await locator<SharedPreferencesHelper>().storeValueString(
            'dataTokenLogin', jsonEncode(dataTokenLoginModel));

        await locator<SharedPreferencesHelper>().storeValueString(
            'idUser', dataTokenLoginModel.data.idUser.toString());
        await locator<SharedPreferencesHelper>().storeValueString(
            'username', dataTokenLoginModel.data.username.toString());
        await locator<SharedPreferencesHelper>()
            .storeValueString('nama', dataTokenLoginModel.data.nama.toString());
        await locator<SharedPreferencesHelper>().storeValueString(
            'no_hp', dataTokenLoginModel.data.noHp.toString());

        // await Future.wait([
        //   OneSignal.shared.sendTag("idUser", dataTokenLoginModel.data.idUser.toString()),
        //   OneSignal.shared.sendTag("username", dataTokenLoginModel.data.username.toString()),
        // ]);

        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      // emit(state.copyWith(status: FormzStatus.submissionFailure, exceptionError: e.toString()));
      return false;
    }
  }

  Future<void> otpHP(BuildContext context, String noHP) async {
    dataRegister['no_hp'] = noHP;
    authFirebase.verifyPhoneNumber(
        phoneNumber: dataRegister['no_hp'],
        verificationCompleted: (phoneAuthCredential) async{
          print('sd');
          EasyLoading.show(status: "Loading");
          var res = await loginWithCredentials();
          EasyLoading.dismiss();
          if(res){
            EasyLoading.showToast('Berhasil');
            // context.read<AuthenticationBloc>().add(AuthenticationUserLogged(responseLoginUserModel: res));
            Navigator.pushNamedAndRemoveUntil(context, AppRouterStrings.home, (route) => false);
          }else{
            EasyLoading.showToast('Gagal');
          }
        },
        verificationFailed: (FirebaseAuthException authException){
          print("verificationFailed");
        },
        codeSent: (String verId, [int forceCodeResent]) async {
          verificationId = verId;
          await locator<SharedPreferencesHelper>().storeValueString(
          'verPhoneId',verId);
          print(await locator<SharedPreferencesHelper>().getValue('verPhoneId'));
          print("kode masuk");
          print(verificationId);
        },
        codeAutoRetrievalTimeout: (String verId){
          verificationId = verId;
          print("codeAutoRetrievalTimeout");
        });
  }

  Future<void> otp1(BuildContext context) async {
    print(dataRegister['no_hp']);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: dataRegister['no_hp'],
      timeout: Duration(seconds: 120),
      verificationCompleted: (AuthCredential authCredential) {

      },
      verificationFailed: (FirebaseAuthException authException) {
      },
      codeSent: (String verId, [int forceCodeResent]) async {
        await locator<SharedPreferencesHelper>().storeValueString(
            'verPhoneId',verId);
        print(await locator<SharedPreferencesHelper>().getValue('verPhoneId'));
        print("kode masuk");
      },
      codeAutoRetrievalTimeout: (String verId) {

      },
    );
  }

  Future<String> logOut() async {
    // Map<String, dynamic> tags = await OneSignal.shared.getTags();
    List<String> tagsIndex = [];
    // tags.forEach((index, data) {
    //   tagsIndex.add(index);
    // });
    // OneSignal.shared.deleteTags(tagsIndex);
    await locator<SharedPreferencesHelper>().logout();
  }


  Future<bool> signIn(var otp) async {
    try {
     var user = await authFirebase.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      ));

     if (user != null) {
       print("berhasil login");
       return true;
     } else {
       print("salah kode");
       return false;
     }
    } catch (e) {
      print("ini error yaaaaa" + e);
      return false;
    }
  }
}

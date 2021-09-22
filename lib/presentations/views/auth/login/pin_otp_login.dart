import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/configs/utils/shared_preference_helper.dart';
import 'package:kuybasket/providers/login_provider.dart';
import 'package:kuybasket/providers/register_provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../locator.dart';
import '../../../../providers/login_provider.dart';
import '../../base_view.dart';

class PinOtpLogin extends StatefulWidget {
  final String noHp;
  PinOtpLogin({this.noHp});
  @override
  _PinOtpLoginState createState() => _PinOtpLoginState();
}

class _PinOtpLoginState extends State<PinOtpLogin> {
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(235, 236, 237, 1),
    borderRadius: BorderRadius.circular(5.0),
  );

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginProvider>(
      onModelReady: (model) => model.otpHP(context),
      builder: (context, provider, child){
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Container(
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    Text(
                      "KODE VERIFIKASI",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    vSpace(16),
                    Text(
                      "SMS dengan kode verifikasi telah dikirimkan ke " +
                          widget.noHp,
                      textAlign: TextAlign.center,
                    ),
                    vSpace(32),
                    PinCodeTextField(
                      pinTheme: PinTheme(
                        inactiveFillColor: Colors.grey,
                        inactiveColor: Colors.grey,
                      ),
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      animationType: AnimationType.fade,
                      cursorColor: Colors.black,
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      boxShadows: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) async {
                        EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
                        provider.otp = v;

                        var res2 = await provider.signIn(v);
                        if(res2){
                           bool res = await provider.loginWithCredentials();
                          EasyLoading.dismiss();
                          if(res){
                            EasyLoading.showToast('Berhasil');
                            Navigator.pushNamedAndRemoveUntil(
                                context, AppRouterStrings.home, (route) => false);
                          }else{
                            Navigator.pushNamedAndRemoveUntil(
                                context, AppRouterStrings.login, (route) => false);
                            EasyLoading.showError("Nomor hp anda belum terdaftar");
                          }
                        }else{
                          EasyLoading.dismiss();
                          EasyLoading.showError("Otp anda salah");
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          // currentText = value;
                        });
                      },
                    ),
                    vSpace(32),
                    RichText(
                      text: TextSpan(
                          text: "SMS tidak masuk? ",
                          style: textBlack,
                          children: [
                            TextSpan(
                              text: "Kirim Ulang Kode",
                              style: TextStyle(
                                  color: primaryColor,
                                  decoration: TextDecoration.underline),
                            )
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/configs/utils/shared_preference_helper.dart';
import 'package:kuybasket/presentations/views/base_view.dart';
import 'package:kuybasket/providers/login_provider.dart';
import 'package:kuybasket/providers/register_provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../locator.dart';

class PinOtpLogin extends StatefulWidget {
  final noHp;
  PinOtpLogin({this.noHp});
  @override
  _PinOtpLoginState createState() => _PinOtpLoginState();
}

class _PinOtpLoginState extends State<PinOtpLogin> {
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(235, 236, 237, 1),
    borderRadius: BorderRadius.circular(5.0),
  );
  TextEditingController pinotp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginProvider>(
      onModelReady: (model)=>model.otpHP(context, widget.noHp),
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
                          provider.dataRegister['no_hp'],
                      textAlign: TextAlign.center,
                    ),
                    vSpace(32),
                    PinCodeTextField(
                      controller: pinotp,
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
                        EasyLoading.show(status: "Loading");
                        var res = await provider.signIn(v);
                        print("res $res");
                        if(res){
                          provider.dataRegister['no_hp'] = widget.noHp;
                          var res2 = await provider.loginWithCredentials();
                          print("res2 $res2");
                          if(res2){
                            EasyLoading.showToast('Berhasil');
                            Navigator.pushNamedAndRemoveUntil(
                                context, AppRouterStrings.home, (route) => false);
                          } else{
                            EasyLoading.showToast('Belum Terdaftar');
                          }
                          EasyLoading.dismiss();
                        } else{
                          print("kode salah");
                          pinotp.clear();
                          EasyLoading.showToast('Kode Salah');
                        }
                        EasyLoading.dismiss();
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
                              recognizer: TapGestureRecognizer()..onTap = (){
                                print("tap tap");
                                provider.otpHP(context, widget.noHp);
                              },
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

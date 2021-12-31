import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/providers/register_provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinOtpRegister extends StatefulWidget {
  final RegisterProvider provider;
  PinOtpRegister({this.provider});
  @override
  _PinOtpRegisterState createState() => _PinOtpRegisterState();
}

class _PinOtpRegisterState extends State<PinOtpRegister> {
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(235, 236, 237, 1),
    borderRadius: BorderRadius.circular(5.0),
  );

  GlobalKey globalKey = GlobalKey();
  Timer _timer;
  int _start = 59;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          widget.provider.sendCode(globalKey.currentContext));
      });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
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
                      widget.provider.dataRegister['no_hp'],
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    var res = await widget.provider.registerWithCredentials();
                    EasyLoading.dismiss();
                    if (res) {
                      EasyLoading.showToast('Berhasil');
                      // context.read<AuthenticationBloc>().add(AuthenticationUserLogged(responseLoginUserModel: res));
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRouterStrings.home, (route) => false);
                    } else {
                      EasyLoading.showToast('Gagal');
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      // currentText = value;
                    });
                  },
                ),
                vSpace(32),
                _timer.isActive
                    ? Text('0:$_start')
                    : RichText(
                        text: TextSpan(
                          text: 'Belum menerima kode?',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                          children: [
                            TextSpan(
                                text: ' Kirim Ulang',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => widget.provider
                                      .sendCode(globalKey.currentContext)),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

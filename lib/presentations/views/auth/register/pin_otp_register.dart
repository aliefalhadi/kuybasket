import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/logics/blocs/authentication/authentication_bloc.dart';
import 'package:kuybasket/logics/cubits/register/register_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinOtpRegister extends StatefulWidget {
  @override
  _PinOtpRegisterState createState() => _PinOtpRegisterState();
}

class _PinOtpRegisterState extends State<PinOtpRegister> {
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(235, 236, 237, 1),
    borderRadius: BorderRadius.circular(5.0),
  );

  @override
  Widget build(BuildContext context) {
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
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                vSpace(16),
                Text(
                  "SMS dengan kode verifikasi telah dikirimkan ke +62222XXX",
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
                  length: 4,
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
                    var res = await BlocProvider.of<RegisterCubit>(context).registerWithCredentials();
                    EasyLoading.dismiss();
                    if(res != null){
                      EasyLoading.showToast('Berhasil');
                      context.read<AuthenticationBloc>().add(AuthenticationUserLogged(responseLoginUserModel: res));
                      Navigator.pushNamedAndRemoveUntil(context, AppRouterStrings.home, (route) => false);
                    }else{
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
  }
}

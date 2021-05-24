import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/logics/cubits/login/login_cubit.dart';
import 'package:formz/formz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.lightGreen,
                        child: Icon(
                          Icons.check,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    vSpace(
                      24,
                    ),
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    vSpace(32),
                    _UsernameTextField(),
                    vSpace(16),
                    _PasswordTextField(),
                    vSpace(16),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Lupa Password?",
                        style: TextStyle(color: primaryColor),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    // Text("Belum memiliki akun? Daftar"),
                    RichText(
                      text: TextSpan(
                          text: "Belum memiliki akun? ",
                          style: textBlack,
                          children: [
                            TextSpan(
                              text: "Daftar",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, AppRouterStrings.register);
                                },
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    _ButtonLogin(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonLogin extends StatelessWidget {
  const _ButtonLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
  builder: (context, state) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        padding: EdgeInsets.all(16),
        color: primaryColor,
        child: Text(
          "LOGIN",
          style: textWhite,
        ),
        onPressed:  state.status.isValidated ?
            () async {
          FocusScope.of(context).unfocus();
          EasyLoading.show(status: 'loading...');
          bool resRegister = await context
              .read<LoginCubit>()
              .loginWithCredentials();
          if(resRegister){
            EasyLoading.dismiss();
            Alert(
              context: context,
              type: AlertType.success,
              title: "Registrasi Berhasil",
              desc: "Silahkan login menggunakan username yang telah didaftarkan.",
              buttons: [
                DialogButton(
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.pop(context),
                  width: 120,
                )
              ],
            ).show();
          }
        }: null,
      ),
    );
  },
);
  }
}

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (prev, next) => prev.password != next.password,
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Password",
          ),
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
        );
      },
    );
  }
}

class _UsernameTextField extends StatelessWidget {
  const _UsernameTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (prev, next) => prev.username != next.username,
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            hintText: "Username",
          ),
          onChanged: (username) =>
              context.read<LoginCubit>().usernameChanged(username),
        );
      },
    );
  }
}

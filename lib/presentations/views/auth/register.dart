import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/logics/cubits/register/register_cubit.dart';
import 'package:formz/formz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
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
                        "Register",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      vSpace(32),
                      _NameTextField(),
                      vSpace(16),
                      _UsernameTextField(),
                      vSpace(16),
                      _NomorHpTextField(),
                      vSpace(16),
                      _PasswordTextField(),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      // Text("Belum memiliki akun? Daftar"),
                      vSpace(40),
                      RichText(
                        text: TextSpan(
                            text: "Sudah memiliki akun? ",
                            style: textBlack,
                            children: [
                              TextSpan(
                                text: "Login",
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
                      _ButtonRegister(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonRegister extends StatelessWidget {
  const _ButtonRegister({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: RaisedButton(
              child: Text(
                'Register',
                style: textWhite.copyWith(fontWeight: FontWeight.bold),
              ),
              color: primaryColor,
              onPressed: state.status.isValidated
                  ? () async {
                      FocusScope.of(context).unfocus();
                      EasyLoading.show(status: 'loading...');
                      bool resRegister = await context
                          .read<RegisterCubit>()
                          .registerWithCredentials();
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
                    }
                  : null),
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
    return BlocBuilder<RegisterCubit, RegisterState>(
        buildWhen: (prev, next) => prev.password != next.password,
        builder: (context, state) {
          return TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
            ),
            onChanged: (password) =>
                context.read<RegisterCubit>().passwordChanged(password),
          );
        });
  }
}

class _NomorHpTextField extends StatelessWidget {
  const _NomorHpTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
        buildWhen: (prev, next) => prev.noHp != next.noHp,
        builder: (context, state) {
          return TextFormField(
            decoration: InputDecoration(
              hintText: "Nomor Hp",
            ),
            onChanged: (noHp) =>
                context.read<RegisterCubit>().noHpChanged(noHp),
          );
        });
  }
}

class _UsernameTextField extends StatelessWidget {
  const _UsernameTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
        buildWhen: (prev, next) => prev.username != next.username,
        builder: (context, state) {
          return TextFormField(
            decoration: InputDecoration(
              hintText: "Username",
            ),
            onChanged: (username) =>
                context.read<RegisterCubit>().usernameChanged(username),
          );
        });
  }
}

class _NameTextField extends StatelessWidget {
  const _NameTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (prev, next) => prev.name != next.name,
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            hintText: "Name",
          ),
          onChanged: (name) => context.read<RegisterCubit>().nameChanged(name),
        );
      },
    );
  }
}

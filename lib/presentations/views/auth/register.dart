import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/logics/cubits/register/register_cubit.dart';

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
                      _UsernameTextField(),
                      vSpace(16),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Username",
                        ),
                      ),
                      vSpace(16),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Nomor Hp",
                        ),
                      ),
                      vSpace(16),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                        ),
                      ),
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          padding: EdgeInsets.all(16),
                          color: primaryColor,
                          child: Text(
                            "REGISTER",
                            style: textWhite,
                          ),
                          onPressed: () {},
                        ),
                      ),
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

class _UsernameTextField extends StatelessWidget {
  const _UsernameTextField({
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
          onChanged: ,
        );
      },
    );
  }
}

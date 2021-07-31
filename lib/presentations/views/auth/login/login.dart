import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/presentations/views/base_view.dart';
import 'package:kuybasket/presentations/widgets/label_text_field.dart';
import 'package:kuybasket/providers/login_provider.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController noHP = TextEditingController();
  bool next = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginProvider>(
      builder: (context, provider, child){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          floatingActionButton: new Visibility(
            visible: next,
            child: FloatingActionButton(
              onPressed: () {
                provider.otpHP(context);
                Navigator.pushReplacementNamed(context, AppRouterStrings.otpLogin, arguments: provider);
              },
              child: Icon(Icons.arrow_right_alt),
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                vSpace(16),
                Text("Silahkan masukkan nomor hp yang telah terdaftar"),
                vSpace(8),
                LabelTextField(label: 'Nomor HP'),
                TextFormField(
                  initialValue: "+62",
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  onChanged: (value){
                    provider.stateChanged(field: 'no_hp', value: value);
                    if(value.length>=4){
                      setState(() {
                        next = true;
                      });
                    } else  {
                      setState(() {
                        next = false;
                      });
                    }
                  }
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

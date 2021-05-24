import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
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
                  vSpace(24,),
                  Text("Login", style: Theme.of(context).textTheme.headline3,),
                  vSpace(32),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      hintText: "Username",
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                        hintText: "Password",
                        border: OutlineInputBorder(borderSide: BorderSide())),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text("Lupa Password?", style: TextStyle(color: primaryColor),),
                  )
                ],
              ),
            ),

            keyboardVisible ?
             Container() : Container(
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
                                decoration: TextDecoration.underline
                            ),
                            recognizer: TapGestureRecognizer()..onTap = (){
                              Navigator.pushNamed(context, AppRouterStrings.register);
                            },
                          )
                        ]
                    ),
                  ),
                  SizedBox(height: 24,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      padding: EdgeInsets.all(16),
                      color: primaryColor,
                      child: Text("LOGIN", style: textWhite,),
                      onPressed: (){},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

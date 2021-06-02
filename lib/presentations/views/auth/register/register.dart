import 'package:flutter/material.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/presentations/views/base_view.dart';
import 'package:kuybasket/presentations/widgets/label_text_field.dart';
import 'package:kuybasket/providers/register_provider.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterProvider>(
      builder: (context, provider, child){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRouterStrings.otpRegister, arguments: provider);
            },
            child: Icon(Icons.arrow_right_alt),
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Daftar",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                vSpace(16),
                Text("Lengkapi data dirimu di bawah ini, ya"),
                vSpace(8),
                LabelTextField(label: 'Nama Lengkap'),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  cursorColor: Colors.black,
                  onChanged: (value)=> provider.stateChanged(field: 'name', value: value),
                ),
                LabelTextField(label: 'Email'),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value)=> provider.stateChanged(field: 'email', value: value),
                ),
                LabelTextField(label: 'Nomor HP'),
                TextFormField(
                  initialValue: "+62",
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  onChanged: (value)=> provider.stateChanged(field: 'no_hp', value: value),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
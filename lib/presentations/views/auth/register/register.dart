import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/logics/cubits/register/register_cubit.dart';
import 'package:kuybasket/presentations/widgets/label_text_field.dart';
import 'package:formz/formz.dart';

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
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        floatingActionButton: _FloatingActionButton(),
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
              _NamaTextField(),
              LabelTextField(label: 'Email'),
              _EmailTextField(),
              LabelTextField(label: 'Nomor HP'),
              _NoHPTextField()
            ],
          ),
        ),
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (prev, next) => prev.status != next.status,
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: state.status.isValidated
              ? () {
                  Navigator.pushReplacementNamed(
                      context, AppRouterStrings.otpRegister);
                }
              : null,
          child: Icon(Icons.arrow_right_alt),
        );
      },
    );
  }
}

class _NoHPTextField extends StatelessWidget {
  const _NoHPTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (prev, next) => prev.noHp != next.noHp,
      builder: (context, state) {
        return TextFormField(
          initialValue: "+62",
          cursorColor: Colors.black,
          onChanged: (noHP) => context.read<RegisterCubit>().noHpChanged(noHP),
        );
      },
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (prev, next) => prev.email != next.email,
      builder: (context, state) {
        return TextFormField(
          textInputAction: TextInputAction.done,
          cursorColor: Colors.black,
          onChanged: (email) =>
              context.read<RegisterCubit>().emailChanged(email),
        );
      },
    );
  }
}

class _NamaTextField extends StatelessWidget {
  const _NamaTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (prev, next) => prev.nama != next.nama,
      builder: (context, state) {
        return TextFormField(
          textInputAction: TextInputAction.done,
          cursorColor: Colors.black,
          onChanged: (nama) => context.read<RegisterCubit>().namaChanged(nama),
        );
      },
    );
  }
}

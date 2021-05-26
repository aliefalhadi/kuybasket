import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:kuybasket/data/repositories/auth/auth_repository.dart';
import 'package:kuybasket/data/validation_models/string_validation.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  AuthRepository _authRepository = AuthRepository();
  RegisterCubit() : super(RegisterState());

  void namaChanged(String value) {
    final nama = StringValidation.dirty(value);
    emit(state.copyWith(
      nama: nama,
      status: Formz.validate([
        nama,
        state.email,
        state.noHp,
      ]),
    ));
  }

  void emailChanged(String value) {
    final email = StringValidation.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        email,
        state.nama,
        state.noHp,
      ]),
    ));
  }

  void noHpChanged(String value) {
    final noHp = StringValidation.dirty(value);
    emit(state.copyWith(
      noHp: noHp,
      status: Formz.validate([
        noHp,
        state.nama,
        state.email,
      ]),
    ));
  }


  Future<bool> registerWithCredentials() async {
    if (!state.status.isValidated) return null;
    log(state.noHp.toString(), name: 'asd');
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      Map dataRegist = {
        'name': state.nama.value,
        'email' : state.email.value,
        'no_hp' : state.noHp.value
      };

      bool res = await _authRepository.postRegisterUser(jsonEncode(dataRegist));
      if(res){
        return true;
      }else{
        return false;
      }
    } on Exception catch (e) {
      // emit(state.copyWith(status: FormzStatus.submissionFailure, exceptionError: e.toString()));
      return false;
    }
  }
}

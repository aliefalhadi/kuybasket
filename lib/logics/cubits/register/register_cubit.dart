import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:kuybasket/data/validation_models/password_validation.dart';
import 'package:kuybasket/data/validation_models/string_validation.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
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
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await Future.delayed(Duration(milliseconds: 5000));
      // emit(state.copyWith(status: FormzStatus.submissionSuccess));
      return true;
    } on Exception catch (e) {
      // emit(state.copyWith(status: FormzStatus.submissionFailure, exceptionError: e.toString()));
      return false;
    }
  }
}

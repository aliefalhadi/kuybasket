import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:kuybasket/data/validation_models/password_validation.dart';
import 'package:kuybasket/data/validation_models/string_validation.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  void nameChanged(String value) {
    final name = StringValidation.dirty(value);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([
        name,
        state.username,
        state.noHp,
        state.password,
      ]),
    ));
  }

  void usernameChanged(String value) {
    final username = StringValidation.dirty(value);
    emit(state.copyWith(
      username: username,
      status: Formz.validate([
        username,
        state.name,
        state.noHp,
        state.password,
      ]),
    ));
  }

  void noHpChanged(String value) {
    final noHp = StringValidation.dirty(value);
    emit(state.copyWith(
      noHp: noHp,
      status: Formz.validate([
        noHp,
        state.name,
        state.username,
        state.password,
      ]),
    ));
  }

  void passwordChanged(String value) {
    final password = PasswordValidation.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([
        password,
        state.name,
        state.username,
        state.noHp,
      ]),
    ));
  }

  Future<void> registerWithCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await Future.delayed(Duration(milliseconds: 500));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure, exceptionError: e.toString()));
    }
  }
}

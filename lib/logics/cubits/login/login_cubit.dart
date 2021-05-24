import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:kuybasket/data/validation_models/password_validation.dart';
import 'package:kuybasket/data/validation_models/string_validation.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void usernameChanged(String value) {
    final username = StringValidation.dirty(value);
    emit(state.copyWith(
      username: username,
      status: Formz.validate([
        username,
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
        state.username,
      ]),
    ));
  }

  Future<bool> loginWithCredentials() async {
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

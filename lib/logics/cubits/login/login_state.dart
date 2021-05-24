part of 'login_cubit.dart';

class LoginState extends Equatable {
  final StringValidation username;
  final PasswordValidation password;
  final FormzStatus status;
  final String exceptionError;

  const LoginState({
    this.username = const StringValidation.pure(),
    this.password = const PasswordValidation.pure(),
    this.status = FormzStatus.pure,
    this.exceptionError
  });

  @override
  List<Object> get props => [username, password, status, exceptionError];

  LoginState copyWith({
    StringValidation username,
    PasswordValidation password,
    FormzStatus status,
    String exceptionError,
  }) {
    if ((username == null || identical(username, this.username)) &&
        (password == null || identical(password, this.password)) &&
        (status == null || identical(status, this.status)) &&
        (exceptionError == null ||
            identical(exceptionError, this.exceptionError))) {
      return this;
    }

    return new LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
      exceptionError: exceptionError ?? this.exceptionError,
    );
  }

  @override
  String toString() {
    return 'LoginState{status: $status}';
  }
}

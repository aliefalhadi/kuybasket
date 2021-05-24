part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final StringValidation name;
  final StringValidation username;
  final StringValidation noHp;
  final PasswordValidation password;
  final FormzStatus status;
  final String exceptionError;

  const RegisterState({
    this.name = const StringValidation.pure(),
    this.username = const StringValidation.pure(),
    this.noHp = const StringValidation.pure(),
    this.password = const PasswordValidation.pure(),
    this.status = FormzStatus.pure,
    this.exceptionError,
  });

  @override
  List<Object> get props => [name, username, noHp, password, status, exceptionError];

  RegisterState copyWith({
    final StringValidation name,
    final StringValidation username,
    final StringValidation noHp,
    final PasswordValidation password,
    final FormzStatus status,
    final String exceptionError,
  }) {
    return RegisterState(
      name: name ?? this.name,
      username: username ?? this.username,
      noHp: noHp ?? this.noHp,
      password: password ?? this.password,
      status: status ?? this.status,
      exceptionError: exceptionError ?? this.exceptionError,
    );
  }
}

part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final StringValidation nama;
  final StringValidation email;
  final StringValidation noHp;
  final FormzStatus status;
  final String exceptionError;

  const RegisterState({
    this.nama = const StringValidation.pure(),
    this.email = const StringValidation.pure(),
    this.noHp = const StringValidation.pure(),
    this.status = FormzStatus.pure,
    this.exceptionError,
  });

  @override
  List<Object> get props => [nama, email, noHp, status, exceptionError];

  RegisterState copyWith({
    final StringValidation nama,
    final StringValidation email,
    final StringValidation noHp,
    final FormzStatus status,
    final String exceptionError,
  }) {
    return RegisterState(
      nama: nama ?? this.nama,
      email: email ?? this.email,
      noHp: noHp ?? this.noHp,
      status: status ?? this.status,
      exceptionError: exceptionError ?? this.exceptionError,
    );
  }

  @override
  String toString() {
    return 'RegisterState{status: $status}';
  }
}

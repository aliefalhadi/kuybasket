part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationUserLogged extends AuthenticationEvent {
  final ResponseLoginUserModel responseLoginUserModel;

  const AuthenticationUserLogged({this.responseLoginUserModel});



  @override
  List<Object> get props => [responseLoginUserModel];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}

class AuthenticationInit extends AuthenticationEvent {}
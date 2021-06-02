import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kuybasket/data/models/ResponseLoginUserModel.dart';
import 'package:kuybasket/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState.unknown());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if(event is AuthenticationInit){
      yield* _mapAppStarted(event);
    }else if(event is AuthenticationUserLogged){
      UserModel userModel = UserModel(
        id: event.responseLoginUserModel.data.id.toString(),
        name: event.responseLoginUserModel.data.name.toString(),
        username: event.responseLoginUserModel.data.username.toString(),
        email: event.responseLoginUserModel.data.email.toString(),
      );
      yield AuthenticationState.authenticated(userModel);
    }
  }

  Stream<AuthenticationState> _mapAppStarted(AuthenticationInit event)async*{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      if(sharedPreferences.containsKey('isLogin')){
        SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
        var dataToken = await sharedPreferences.get('data_user');
        ResponseLoginUserModel responseLoginUserModel = responseLoginUserModelFromJson(dataToken);
        UserModel userModel = UserModel(
          id: responseLoginUserModel.data.id.toString(),
          name: responseLoginUserModel.data.name.toString(),
          username: responseLoginUserModel.data.username.toString(),
          email: responseLoginUserModel.data.email.toString(),
        );
        yield AuthenticationState.authenticated(userModel);
      }else{
        yield AuthenticationState.unauthenticated();
      }
  }
}

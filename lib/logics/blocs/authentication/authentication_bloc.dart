import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
    }
  }

  Stream<AuthenticationState> _mapAppStarted(AuthenticationInit event)async*{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      if(sharedPreferences.containsKey('isLogin')){
        UserModel userModel = UserModel(
          id: '1',
          name: '2',
          username: '3'
        );
        yield AuthenticationState.authenticated(userModel);
      }else{
        yield AuthenticationState.unauthenticated();
      }

  }
}

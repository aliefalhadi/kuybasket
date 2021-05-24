import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kuybasket/configs/router/app_router.dart';
import 'package:kuybasket/logics/blocs/authentication/authentication_bloc.dart';
import 'package:kuybasket/logics/debug/app_bloc_observer.dart';
import 'package:kuybasket/presentations/views/home.dart';
import 'package:kuybasket/presentations/views/onboard/onboard.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(App(appRouter: AppRouter(),));
}

class App extends StatelessWidget {
  final AppRouter appRouter;

  App({this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc()..add(AuthenticationInit()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
                borderSide: const BorderSide()),
          ),
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
        builder: EasyLoading.init(),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state){
            if(state.status == AuthenticationStatus.unauthenticated){
              return Onboard();
            }else{
              return Home();
            }
          },
        ),
      ),
    );
  }
}

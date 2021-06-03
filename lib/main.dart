import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kuybasket/configs/router/app_router.dart';
import 'package:kuybasket/locator.dart';
import 'package:kuybasket/presentations/views/home/index.dart';
import 'package:kuybasket/presentations/views/onboard/onboard.dart';
import 'package:kuybasket/providers/MainProvider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  MainProvider mainProvider = locator<MainProvider>();
  mainProvider.onStartApp().then((value){
    return runApp(App(initialRoute: value,));
  });
}

class App extends StatelessWidget {
  final String initialRoute;
  App({this.initialRoute});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(
            padding: EdgeInsets.all(16)
        ),
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
                borderSide: const BorderSide()),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            )
        ),
      ),
      home: initialRoute == 'login' ? Onboard() : Index(),
      onGenerateRoute: AppRouter().onGenerateRoute,
      builder: EasyLoading.init(),
    );
  }
}

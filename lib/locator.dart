import 'package:get_it/get_it.dart';
import 'package:kuybasket/configs/utils/shared_preference_helper.dart';
import 'package:kuybasket/providers/MainProvider.dart';
import 'package:kuybasket/providers/login_provider.dart';
import 'package:kuybasket/providers/register_provider.dart';
import 'package:kuybasket/services/ApiInterceptors.dart';
import 'package:kuybasket/services/auth_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //  init injected file
  //services
  locator.registerLazySingleton(() => ApiInterceptors());
  locator.registerLazySingleton(() => SharedPreferencesHelper());
  locator.registerLazySingleton(() => AuthService());



  // provider
  locator.registerFactory(() => MainProvider());
  locator.registerFactory(() => RegisterProvider());
  locator.registerFactory(() => LoginProvider());
}
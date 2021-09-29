import 'package:get_it/get_it.dart';
import 'package:kuybasket/configs/utils/shared_preference_helper.dart';
import 'package:kuybasket/providers/MainProvider.dart';
import 'package:kuybasket/providers/NotifikasiProvider.dart';
import 'package:kuybasket/providers/dashboard_provider.dart';
import 'package:kuybasket/providers/lapangan_provider.dart';
import 'package:kuybasket/providers/login_provider.dart';
import 'package:kuybasket/providers/pemesanan_provider.dart';
import 'package:kuybasket/providers/register_provider.dart';
import 'package:kuybasket/providers/tanding_provider.dart';
import 'package:kuybasket/services/ApiInterceptors.dart';
import 'package:kuybasket/services/NotifikasiService.dart';
import 'package:kuybasket/services/auth_service.dart';
import 'package:kuybasket/services/lapangan_service.dart';
import 'package:kuybasket/services/pemesanan_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //  init injected file
  //services
  locator.registerLazySingleton(() => ApiInterceptors());
  locator.registerLazySingleton(() => SharedPreferencesHelper());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => LapanganService());
  locator.registerLazySingleton(() => PemesananService());
  locator.registerLazySingleton(() => NotifikasiService());



  // provider
  locator.registerFactory(() => MainProvider());
  locator.registerFactory(() => NotifikasiProvider());
  locator.registerFactory(() => RegisterProvider());
  locator.registerFactory(() => LoginProvider());
  locator.registerFactory(() => DashboardProvider());
  locator.registerFactory(() => PemesananProvider());
  locator.registerFactory(() => LapanganProvider());
  locator.registerFactory(() => TandingProvider());
}
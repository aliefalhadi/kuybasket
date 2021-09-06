import 'package:flutter/material.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/presentations/views/auth/login/pin_otp_login.dart';
import 'package:kuybasket/presentations/views/auth/register/pin_otp_register.dart';
import 'package:kuybasket/presentations/views/auth/register/register.dart';
import 'package:kuybasket/presentations/views/lapangan/detail_info_lapangan.dart';
import 'package:kuybasket/presentations/views/home/index.dart';
import 'package:kuybasket/presentations/views/pemesanan/konfirmasi_pembayaran.dart';
import 'package:kuybasket/presentations/views/auth/login/login.dart';
import 'package:kuybasket/presentations/views/onboard/onboard.dart';
import 'package:kuybasket/presentations/views/pemesanan/upload_bukti_pembayaran.dart';
import 'package:kuybasket/providers/login_provider.dart';
import 'package:kuybasket/providers/register_provider.dart';

class AppRouter {

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouterStrings.onboard:
        return MaterialPageRoute(builder: (_) => Onboard());
        break;
      case AppRouterStrings.login:
        return MaterialPageRoute(builder: (_) => Login());
        break;
      case AppRouterStrings.home:
        return MaterialPageRoute(builder: (_) => Index());
        break;
      case AppRouterStrings.register:
        return MaterialPageRoute(builder: (_) => Register());
        break;
      case AppRouterStrings.otpRegister:
        RegisterProvider registerProvider = routeSettings.arguments;
        return MaterialPageRoute(builder: (_) => PinOtpRegister(provider: registerProvider,));
        break;
      case AppRouterStrings.otpLogin:
        String noHp = routeSettings.arguments;
        return MaterialPageRoute(builder: (_) => PinOtpLogin(noHp: noHp));
        break;
      case AppRouterStrings.detailLapangan:
        String idLapangan = routeSettings.arguments;
        return MaterialPageRoute(builder: (_) => DetailInfoLapangan(idLapangan: idLapangan,));
        break;
      case  AppRouterStrings.konfirmasiPemesanan:
        String idPemesanan = routeSettings.arguments;
        return MaterialPageRoute(builder: (_) => KonfirmasiPembayaran(idPemesanan: idPemesanan,));
        break;
      case  AppRouterStrings.uploadBuktiPembayaran:
        String idPemesanan = routeSettings.arguments;
        return MaterialPageRoute(builder: (_) => UploadBuktiPembayaran(idPemesanan: idPemesanan,));
        break;
      default:
        return null;
    }
  }
}

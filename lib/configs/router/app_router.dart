import 'package:flutter/material.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/presentations/views/auth/register/register.dart';
import 'package:kuybasket/presentations/views/auth/register/pin_otp_register.dart';
import 'package:kuybasket/presentations/views/detail_info_lapangan.dart';
import 'package:kuybasket/presentations/views/index.dart';
import 'package:kuybasket/presentations/views/konfirmasi_pembayaran.dart';
import 'package:kuybasket/presentations/views/auth/login.dart';
import 'package:kuybasket/presentations/views/onboard/onboard.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings)  {
    switch (routeSettings.name) {
      case AppRouterStrings.onboard:
        return MaterialPageRoute(builder: (_) => Onboard());
        break;
      case AppRouterStrings.login:
        return MaterialPageRoute(builder: (_) => Login());
        break;
      case AppRouterStrings.register:
        return MaterialPageRoute(builder: (_) => Register());
      case AppRouterStrings.otpRegister:
        return MaterialPageRoute(builder: (_) => PinOtpRegister());
        break;
      case '/':
        return MaterialPageRoute(builder: (_) => Index());
        break;
      case '/detail':
        return MaterialPageRoute(builder: (_) => DetailInfoLapangan());
        break;
      case '/pesanan/konfirmasi-pembayaran':
        return MaterialPageRoute(builder: (_) => KonfirmasiPembayaran());
        break;
      default:
        return null;
    }
  }
}
import 'package:flutter/material.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key key}) : super(key: key);

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(height: 24,),
                  Image.asset('assets/images/basket.png'),
                  SizedBox(height: 24,),
                  Text("Lakukan Pemesanan Lapangan Basket dengan Lebih Mudah.",style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ), textAlign: TextAlign.center,)
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      elevation: 0,
                      child: Text("Masuk", style: textWhite.copyWith(fontWeight: FontWeight.bold),),
                      onPressed: (){
                        Navigator.pushNamed(context, AppRouterStrings.login);
                      },
                    ),
                  ),
                  vSpace(16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: OutlineButton(
                      borderSide: BorderSide(
                        color: primaryColor
                      ),
                      child: Text("Belum ada akun? Daftar dulu", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),),
                      onPressed: (){
                        Navigator.pushNamed(context, AppRouterStrings.register);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

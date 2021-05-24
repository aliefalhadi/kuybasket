import 'package:flutter/material.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key key}) : super(key: key);

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
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
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ), textAlign: TextAlign.center,)
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff3a3940),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text("Daftar", style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, AppRouterStrings.login);
                      },
                      child: Container(
                          child: Center(
                            child: Text("Login", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            )),
                          )
                      ),
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

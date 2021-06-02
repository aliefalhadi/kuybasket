import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/logics/blocs/authentication/authentication_bloc.dart';
import 'package:kuybasket/presentations/widgets/text_form_search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Icon(
                Icons.location_on,
                color: primaryColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
               BlocProvider.of<AuthenticationBloc>(context).state.user.email,
                style: textBlack,
              ),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.keyboard_arrow_down_outlined, color: primaryColor)
            ],
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: primaryColor,
                ),
                onPressed: () {})
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(16),
            child: ListView(children: [
              Text(
                "Temukan Tempat\nBermainmu",
                style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormSearch(),
              SizedBox(
                height: 24,
              ),
              Text(
                "Recommended",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/detail');
                    },
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 180,
                            child: Image.asset('assets/images/lapangan.png', fit: BoxFit.cover,),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Lapangan Basket", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                SizedBox(height: 8,),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined, color: Colors.grey, size: 16,),
                                    Text("Jalan soebrantas nomor 41", style: TextStyle(color: Colors.grey),)
                                  ],
                                ),
                                SizedBox(height: 16,),
                                RichText(text: TextSpan(
                                  text: 'Rp ',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                      text: '20.000',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                    TextSpan(
                                      text: ' / Jam',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ]
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),


                ],
              ),
            ]) // This trailing comma makes auto-formatting nicer for build methods.
            ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

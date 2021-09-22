import 'package:flutter/material.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';

class DetailTanding extends StatelessWidget {
  const DetailTanding({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Tanding"),
      ),
      body: Stack(
        children: [
          Container(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          //                    <--- top side
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      )),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(radius: 16,child: Icon(Icons.person, size: 20,)),
                            hSpace(8),
                            Text(
                              "Alief alhadi",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6,
                            ),
                          ],
                        ),
                        vSpace(8),
                        Text("Ayo tanding bersamaku"),
                        vSpace(8),
                        Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_today_outlined, size: 18),
                                  hSpace(4),
                                  Text("27 Sep 2021"),
                                ],
                              ),
                            ),
                            hSpace(16),
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.access_alarm, size: 18,),
                                  hSpace(4),
                                  Text("20.00 WIB"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: false,
                  child: Container(
                    child: Column(
                      children: [
                        Text("Belum ada yang bergabung")
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: true,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.person),
                          title: Text("Alief saya mau bergabung"),
                          subtitle: Text("2 jam yang lalu"),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.person),
                          title: Text("Alief saya mau bergabung"),
                          subtitle: Text("2 jam yang lalu"),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            child: Container(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: (){},
                  child: Text("Bergabung", style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

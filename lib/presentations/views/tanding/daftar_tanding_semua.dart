import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/constants/strings.dart';
import 'package:kuybasket/configs/constants/view_state.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/configs/utils/NumberFormatHelper.dart';
import 'package:kuybasket/presentations/views/base_view.dart';
import 'package:kuybasket/providers/pemesanan_provider.dart';

class DaftarTandingSemua extends StatefulWidget {
  const DaftarTandingSemua({Key key}) : super(key: key);

  @override
  _DaftarTandingSemuaState createState() => _DaftarTandingSemuaState();
}

class _DaftarTandingSemuaState extends State<DaftarTandingSemua> {
  @override
  Widget build(BuildContext context) {
    return BaseView<PemesananProvider>(
      builder: (context, provider, child) {
        return provider.state == ViewState.Fetching
            ? Center(
                child: CircularProgressIndicator(),
              )
            : provider.state == ViewState.FetchNull
                ? Center(
                    child: Text("Belum ada data pemesanan"),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: ListView(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRouterStrings.detailTanding);
                          },
                          child: Container(
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
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
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
                        )
                      ],
                    ),
                  );
      },
    );
  }
}

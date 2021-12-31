import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/constants/view_state.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/configs/utils/UrlLauncherHelper.dart';
import 'package:kuybasket/presentations/views/base_view.dart';
import 'package:kuybasket/providers/tanding_provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailTanding extends StatelessWidget {
  final String idTanding;
  const DetailTanding({Key key, this.idTanding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<TandingProvider>(
      onModelReady: (model) => model.getDetail(idTanding),
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Detail Tanding"),
          ),
          body: provider.state == ViewState.Fetching
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
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
                                      CircleAvatar(
                                          radius: 16,
                                          child: Icon(
                                            Icons.person,
                                            size: 20,
                                          )),
                                      hSpace(8),
                                      Text(
                                        provider
                                            .detailTandingModel.data.user.name,
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
                                            Icon(Icons.calendar_today_outlined,
                                                size: 18),
                                            hSpace(4),
                                            Text(DateFormat('dd MMMM yyyy')
                                                .format(provider
                                                    .detailTandingModel
                                                    .data
                                                    .tanding
                                                    .tglTanding)),
                                          ],
                                        ),
                                      ),
                                      hSpace(16),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.access_alarm,
                                              size: 18,
                                            ),
                                            hSpace(4),
                                            Text(DateFormat('HH:mm').format(
                                                provider.detailTandingModel.data
                                                    .tanding.tglTanding)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          provider.detailTandingModel.data.lawan.isEmpty
                              ? Container(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      Text("Belum ada yang bergabung")
                                    ],
                                  ),
                                )
                              : Container(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                        provider.detailTandingModel.data.lawan
                                            .length, (index) {
                                      return ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: Icon(Icons.person),
                                        title: Text(
                                            "${provider.detailTandingModel.data.lawan[index].user.name}\nsaya mau bergabung"),
                                        subtitle: Text(timeago.format(provider
                                            .detailTandingModel
                                            .data
                                            .lawan[index]
                                            .tandingLawan
                                            .createdAt)),
                                        trailing: provider.isTandingSaya
                                            ? provider.detailTandingModel.data
                                                        .tanding.status ==
                                                    0
                                                ? OutlineButton(
                                                    child: Text(
                                                      "Pilih",
                                                      style: TextStyle(
                                                          color: Colors.blue),
                                                    ),
                                                    onPressed: () async {
                                                      EasyLoading.show(
                                                          status: "Loading...");

                                                      bool res = await provider
                                                          .buatPilihLawan(provider
                                                              .detailTandingModel
                                                              .data
                                                              .lawan[index]
                                                              .user
                                                              .id
                                                              .toString());
                                                      EasyLoading.dismiss();
                                                      if (res) {
                                                        EasyLoading.showSuccess(
                                                            'Berhasil pilih lawan tanding');
                                                        provider.getDetail(
                                                            idTanding);
                                                      } else {
                                                        EasyLoading.showSuccess(
                                                            'Gagal pilih lawan tanding, silahkan coba lagi');
                                                      }
                                                    },
                                                  )
                                                : provider
                                                            .detailTandingModel
                                                            .data
                                                            .lawan[index]
                                                            .tandingLawan
                                                            .status ==
                                                        1
                                                    ? OutlineButton(
                                                        child: Text("Hubungi"),
                                                        onPressed: () {
                                                          String noHp = provider
                                                              .detailTandingModel
                                                              .data
                                                              .lawan[index]
                                                              .user
                                                              .noHp;
                                                          String url() {
                                                            if (Platform
                                                                .isIOS) {
                                                              return "whatsapp://wa.me/+$noHp";
                                                            } else {
                                                              return "whatsapp://send?phone=+$noHp";
                                                            }
                                                          }

                                                          UrlLauncherHelper
                                                              .launchUrl(
                                                                  url: url());
                                                        },
                                                      )
                                                    : null
                                            : null,
                                      );
                                    }),
                                  ),
                                )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: (provider.isGabung == false &&
                              provider.detailTandingModel.data.tanding.status ==
                                  0)
                          ? true
                          : false,
                      child: Positioned(
                        bottom: 0,
                        child: Container(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton(
                              child: Text(
                                "Bergabung",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                EasyLoading.show(status: "Loading...");

                                bool res = await provider.buatJoin();
                                EasyLoading.dismiss();
                                if (res) {
                                  EasyLoading.showSuccess(
                                      'Berhasil ajukan lawan tanding');
                                  provider.getDetail(idTanding);
                                } else {
                                  EasyLoading.showSuccess(
                                      'Gagal ajukan lawan tanding, silahkan coba lagi');
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: (provider.isGabung == false &&
                              provider.detailTandingModel.data.tanding.status ==
                                  0)
                          ? false
                          : true,
                      child: Positioned(
                        bottom: 0,
                        child: Container(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton(
                              child: Text(
                                "Pesan Lapangan",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRouterStrings.daftarLapangan);
                              },
                            ),
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

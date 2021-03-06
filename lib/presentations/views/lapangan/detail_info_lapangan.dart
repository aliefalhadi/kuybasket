import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:kuybasket/configs/constants/strings.dart';
import 'package:kuybasket/configs/constants/view_state.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/configs/utils/NumberFormatHelper.dart';
import 'package:kuybasket/configs/utils/UrlLauncherHelper.dart';
import 'package:kuybasket/presentations/views/base_view.dart';
import 'package:kuybasket/presentations/views/lapangan/detail_pemesanan_lapangan.dart';
import 'package:kuybasket/presentations/widgets/read_more_text.dart';
import 'package:kuybasket/providers/lapangan_provider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DetailInfoLapangan extends StatefulWidget {
  final String idLapangan;
  const DetailInfoLapangan({this.idLapangan});

  @override
  _DetailInfoLapanganState createState() => _DetailInfoLapanganState();
}

class _DetailInfoLapanganState extends State<DetailInfoLapangan> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BaseView<LapanganProvider>(
      onModelReady: (model) => model.getDetailLapangan(widget.idLapangan),
      builder: (context, provider, child) {
        return Scaffold(
          key: _scaffoldKey,
            backgroundColor: Colors.white,
            body: provider.state == ViewState.Fetching
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : provider.state == ViewState.ErrConnection
                    ? Center(
                        child: Text("Periksa jaringan anda"),
                      )
                    : _Container(provider: provider, globalKey: _scaffoldKey,));
      },
    );
  }
}

class _Container extends StatelessWidget {
  final LapanganProvider provider;
  final GlobalKey globalKey;
  const _Container({
   this.provider,
    this.globalKey
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(bottom: 48),
                child: Column(
                  children: [
                    Container(
                      child: AspectRatio(
                        aspectRatio: 2 / 1.3,
                        child: Container(
                          width:
                              MediaQuery.of(context).size.width,
                          child: Image.network(
                            baseImageUrl+provider.detailLapanganModel.data.fotoLapangan[provider.indexFotoActive].foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          ContainerSnippetFotoLapangan(provider: provider,),
                          vSpace(16),
                          ContainerInfoOpen(provider: provider,),
                          vSpace(16),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                provider.detailLapanganModel.data.dataLapangan.namaLapangan,
                                style: TextStyle(
                                    fontWeight:
                                        FontWeight.bold),
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: 'Rp ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight:
                                              FontWeight.bold,
                                          fontSize: 14),
                                      children: [
                                    TextSpan(
                                      text: valueRupiah(provider.detailLapanganModel.data.dataLapangan.biayaPerJam),
                                      style: TextStyle(
                                          fontWeight:
                                              FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    TextSpan(
                                      text: ' / Jam',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14),
                                    )
                                  ]))
                            ],
                          ),
                          vSpace(16),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.grey,
                                size: 14,
                              ),
                              Text(
                                provider.detailLapanganModel.data.dataLapangan.alamatLapangan,
                                style: TextStyle(
                                    color: Colors.grey),
                              )
                            ],
                          ),
                          vSpace(16),
                          Text(
                            "Fasilitas",
                            style: TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Wrap(
                            spacing: 8,
                            children: List.generate(provider.detailLapanganModel.data.fasilitasLapangan.length, (index){
                              return Container(
                                padding: paddingDelapan,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey),
                                    borderRadius:
                                    borderRadius4),
                                child: Text(
                                  provider.detailLapanganModel.data.fasilitasLapangan[index].fasilitas,
                                  style:
                                  TextStyle(fontSize: 13),
                                ),
                              );
                            }),
                          ),
                          vSpace(16),
                          Text(
                            "Deskripsi",
                            style: TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                          vSpace(8),
                          ReadMoreText(
                            provider.detailLapanganModel.data.dataLapangan.deskripsi,
                            style: TextStyle(fontSize: 12),
                            trimLines: 8,
                            colorClickableText: primaryColor,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '...Lainnya',
                            trimExpandedText: null,
                          ),
                          vSpace(16),
                          Text(
                            "Owner",
                            style: TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                          vSpace(8),
                          ContainerInfoOwner(
                            noHp: provider.detailLapanganModel.data.dataLapangan.kontakAdmin,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 26,
              left: 10,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent
                          .withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding: EdgeInsets.all(8),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    color: primaryColor,
                    child: Text(
                      "Pesan Sekarang",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      showMaterialModalBottomSheet(
                          context: globalKey.currentContext,
                          builder: (context) {
                            return DetailPemesananLapangan(provider: provider,globalKey: globalKey,);
                          });
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      );
  }
}

class ContainerInfoOwner extends StatelessWidget {
  final String noHp;
  const ContainerInfoOwner({
    Key key,
    this.noHp
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  child: Icon(FontAwesome.user_circle),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Admin",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                InkWell(
                  onTap: ()async{
                    String url() {
                      if (Platform.isIOS) {
                        return "whatsapp://wa.me/+$noHp";
                      } else {
                        return "whatsapp://send?phone=+$noHp";
                      }
                    }
                    UrlLauncherHelper.launchUrl(url: url());
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      FontAwesome.whatsapp,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: (){
                    String url() {
                      if (Platform.isIOS) {
                        return "tel:$noHp";
                      } else {
                        return "tel:$noHp";
                      }
                    }
                    UrlLauncherHelper.launchUrl(url: url());
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.call,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ContainerInfoOpen extends StatelessWidget {
  final LapanganProvider provider;
  const ContainerInfoOpen({
    this.provider
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              color: provider.detailLapanganModel.data.dataLapangan.status == 'tutup' ?Colors.red.withOpacity(0.2) :Colors.green.withOpacity(0.2),
              child: Text(
                provider.detailLapanganModel.data.dataLapangan.status.toUpperCase(),
                style:
                    TextStyle(color: provider.detailLapanganModel.data.dataLapangan.status == 'tutup' ? Colors.red :Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              color: primaryColor.withOpacity(0.2),
              child: Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 15,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    convertJam(provider.detailLapanganModel.data.dataLapangan.jamBuka)+" - "+convertJam(provider.detailLapanganModel.data.dataLapangan.jamTutup),
                    style: TextStyle(fontSize: 13, color: primaryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 14,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "(2 Review)",
              style: TextStyle(fontSize: 10, color: Colors.grey),
            )
          ],
        )
      ],
    );
  }
}

class ContainerSnippetFotoLapangan extends StatelessWidget {
  final LapanganProvider provider;
  const ContainerSnippetFotoLapangan({
    this.provider
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(provider.detailLapanganModel.data.fotoLapangan.length, (index){
        return InkWell(
            child: SnippetFotoLapangan(
              imageUrl: baseImageUrl+provider.detailLapanganModel.data.fotoLapangan[index].foto,
            ),
          onTap: (){
              provider.changedActiveFoto(index);
          },
        );
      }),
    );
  }
}

class SnippetFotoLapangan extends StatelessWidget {
  final String imageUrl;
  const SnippetFotoLapangan({
   this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 48,
      height: 48,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

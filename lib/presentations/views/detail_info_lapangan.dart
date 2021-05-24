import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/presentations/views/detail_pemesanan_lapangan.dart';
import 'package:kuybasket/presentations/widgets/read_more_text.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DetailInfoLapangan extends StatefulWidget {
  const DetailInfoLapangan({Key key}) : super(key: key);

  @override
  _DetailInfoLapanganState createState() => _DetailInfoLapanganState();
}

class _DetailInfoLapanganState extends State<DetailInfoLapangan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
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
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              'assets/images/lapangan.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ContainerSnippetFotoLapangan(),
                            vSpace(16),
                            ContainerInfoOpen(),
                            vSpace(16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Lapangan Basket",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: 'Rp ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                        children: [
                                      TextSpan(
                                        text: '20.000',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      TextSpan(
                                        text: ' / Jam',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14),
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
                                  "Jalan soebrantas nomor 41",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            vSpace(16),
                            Text(
                              "Fasilitas",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Wrap(
                              spacing: 8,
                              children: [
                                Container(
                                  padding: paddingDelapan,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: borderRadius4),
                                  child: Text(
                                    "R. Ganti",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                                Container(
                                  padding: paddingDelapan,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: borderRadius4),
                                  child: Text(
                                    "Loker",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                )
                              ],
                            ),
                            vSpace(16),
                            Text(
                              "Deskripsi",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            vSpace(8),
                            ReadMoreText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse lobortis maximus molestie. Nullam at quam in ante ultricies aliquet. In hac habitasse platea dictumst. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam aliquam, justo eu dictum bibendum, turpis magna vulputate orci, vitae placerat turpis diam sed elit. Aenean eu nulla cursus, consequat eros non, molestie lorem. Maecenas nec ornare lorem. Sed congue vehicula purus, in facilisis justo commodo non",
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            vSpace(8),
                            ContainerInfoOwner()
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
                        color: Colors.lightBlueAccent.withOpacity(0.2),
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
                            context: context,
                            builder: (context) {
                              return DetailPemesananLapangan();
                            });
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class ContainerInfoOwner extends StatelessWidget {
  const ContainerInfoOwner({
    Key key,
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
                        "Alief alhadi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4,
                      ),
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
                Container(
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
                SizedBox(
                  width: 8,
                ),
                Container(
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
  const ContainerInfoOpen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              color: Colors.green.withOpacity(0.2),
              child: Text(
                "Open",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
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
                    "07.00 - 12.00",
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
  const ContainerSnippetFotoLapangan({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SnippetFotoLapangan(),
        SnippetFotoLapangan(),
      ],
    );
  }
}

class SnippetFotoLapangan extends StatelessWidget {
  const SnippetFotoLapangan({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 48,
      height: 48,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/images/lapangan.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/constants/view_state.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/configs/utils/NumberFormatHelper.dart';
import 'package:kuybasket/presentations/views/base_view.dart';
import 'package:kuybasket/providers/pemesanan_provider.dart';

class KonfirmasiPembayaran extends StatelessWidget {
  final String idPemesanan;
  const KonfirmasiPembayaran({this.idPemesanan});

  @override
  Widget build(BuildContext context) {
    return BaseView<PemesananProvider>(
      onModelReady: (model) =>
          model.getDetailPemesanan(idPemesanan: idPemesanan),
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Color(0xff28903b),
          body: provider.state == ViewState.Fetching
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: EdgeInsets.all(16),
                  child: ListView(
                    children: [
                      CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.lightGreen,
                        child: Icon(
                          Icons.check,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Selamat, Pesanan Kamu Telah berhasil dibuat",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Selesaikan pemabayaran sebelum",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        DateFormat('dd MMM yyyy, H:m').format(provider
                            .detailPemesananModel
                            .data
                            .dataPemesanan
                            .expiredPembayaranAt),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Card(
                        margin: EdgeInsets.zero,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Total biaya"),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Rp "+valueRupiah(provider.detailPemesananModel.data.dataPemesanan.totalBaya),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            Container(
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text("BRI (a.n." +
                                        provider.detailPemesananModel.data
                                            .dataPemilik.noRekAtasNama +
                                        ")"),
                                    subtitle: Text(provider.detailPemesananModel
                                        .data.dataPemilik.noRek),
                                    trailing: IconButton(
                                      icon: Icon(Icons.copy),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Center(
                          child: Text(
                        "Silahkan transfer biaya pemesanan ke nomor rekening yang ada di atas",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            decoration: TextDecoration.underline),
                      )),
                      SizedBox(
                        height: 16,
                      ),
                      RaisedButton(
                        color: Colors.white,
                        padding: EdgeInsets.all(16),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRouterStrings.uploadBuktiPembayaran, arguments: provider.detailPemesananModel.data.dataPemesanan.idPemesananLapangan.toString());
                        },
                        child: Text(
                          "Upload Bukti Pembayaran",
                          style: textBold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      OutlineButton(
                        padding: EdgeInsets.all(16),
                        borderSide: BorderSide(color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Kembali ke Beranda",
                          style: textBold.copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class ListTileInfo extends StatelessWidget {
  const ListTileInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total biaya"),
          SizedBox(
            height: 8,
          ),
          Text(
            "Rp 200.000",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

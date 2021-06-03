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

class DaftarPemesananBerlangsung extends StatefulWidget {
  const DaftarPemesananBerlangsung({Key key}) : super(key: key);

  @override
  _DaftarPemesananBerlangsungState createState() =>
      _DaftarPemesananBerlangsungState();
}

class _DaftarPemesananBerlangsungState
    extends State<DaftarPemesananBerlangsung> {
  @override
  Widget build(BuildContext context) {
    return BaseView<PemesananProvider>(
      onModelReady: (model) => model.getDaftarPemesanan(status: 'berlangsung'),
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
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: ListView(
                      children: List.generate(provider.daftarPemesananModel.data.length, (index){
                        return  InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, AppRouterStrings.konfirmasiPemesanan,arguments: provider.daftarPemesananModel.data[index].data.idPemesananLapangan.toString());
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
                            child: Row(
                              children: [
                                Container(
                                  width: 140,
                                  height: 100,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        baseImageUrl+provider.daftarPemesananModel.data[index].foto,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                hSpace(16),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          provider.daftarPemesananModel.data[index].dataLapangan.namaLapangan,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        vSpace(8),
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.location_on_sharp,
                                              size: 15,
                                            ),
                                            hSpace(4),
                                            Expanded(child: Text(provider.daftarPemesananModel.data[index].dataLapangan.alamatLapangan))
                                          ],
                                        ),
                                        vSpace(4),
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.date_range,
                                              size: 15,
                                            ),
                                            hSpace(4),
                                            Text(DateFormat('dd MMM yyyy').format(provider.daftarPemesananModel.data[index].data.tanggalPemesanan))
                                          ],
                                        ),
                                        vSpace(4),
                                        Text(
                                          "Rp "+valueRupiah(provider.daftarPemesananModel.data[index].data.totalBaya),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        vSpace(4),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              provider.daftarPemesananModel.data[index].data.status,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  );
      },
    );
  }
}

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kuybasket/configs/constants/view_state.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/presentations/views/base_view.dart';
import 'package:kuybasket/providers/pemesanan_provider.dart';

class DetailPemesanan extends StatefulWidget {
  final String idPemesanan;
  const DetailPemesanan({this.idPemesanan});

  @override
  _DetailPemesananState createState() => _DetailPemesananState();
}

class _DetailPemesananState extends State<DetailPemesanan> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BaseView<PemesananProvider>(
      onModelReady: (model) =>
          model.getDetailPemesananLapangan(idPemesanan: widget.idPemesanan),
      builder: (context, provider, child) {
        return Scaffold(
          key: _globalKey,
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Detail Pemesanan"),
          ),
          body: provider.state == ViewState.Fetching
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 32),
                      padding: EdgeInsets.only(bottom: 32),
                      child: ListView(
                        children: [
                          _ContainerInfo(
                            title: "Status Pemesanan",
                            subtitle: provider
                                .detailPemesananLapanganModel.data.dataPemesanan.status,
                          ),
                          _ContainerInfo(
                            title: "Pemesan",
                            subtitle: provider
                                .detailPemesananLapanganModel.data.dataUserPemesan.name,
                          ),
                          _ContainerInfo(
                            title: "No Hp",
                            subtitle: provider
                                .detailPemesananLapanganModel.data.dataUserPemesan.noHp
                                .toString(),
                          ),
                          _ContainerInfo(
                            title: "Tanggal Main",
                            subtitle: DateFormat('dd MMM yyyy').format(provider
                                .detailPemesananLapanganModel
                                .data
                                .dataPemesanan
                                .tanggalPemesanan),
                          ),
                          _ContainerInfo(
                            title: "Jam Main",
                            subtitle: provider.jamMain,
                          ),
                          _ContainerInfo(
                            title: "Total Bayar",
                            subtitle: provider
                                .detailPemesananLapanganModel.data.dataPemesanan.totalBaya
                                .toString(),
                          ),
                          _ContainerInfo(
                            title: "Tanggal Pemesanan",
                            subtitle: DateFormat('dd MMM yyyy, HH:mm').format(
                                provider.detailPemesananLapanganModel.data.dataPemesanan
                                    .createdAt),
                          ),
                          provider.detailPemesananLapanganModel.data.dataPemesanan.status =='Berhasil' ?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              vSpace(16),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                padding: EdgeInsets.all(8),
                                child: Text("Silahkan datang tepat waktu sesuai jam pemesanan anda dan scan qrcode di bawah ini.", style: TextStyle(color: Colors.white),),
                              ),
                              vSpace(32),
                              BarcodeWidget(
                                barcode: Barcode.qrCode(),
                                data: provider.detailPemesananLapanganModel.data.dataPemesanan.idPemesananLapangan.toString()+" KUYBASKET",
                              )
                            ],
                          )
                              : Container()
                        ],
                      ),
                    ),
                ],
              ),
        );
      },
    );
  }
}

class _ContainerInfo extends StatelessWidget {
  final String title;
  final String subtitle;

  _ContainerInfo({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2)))),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle,),
      ),
    );
  }
}

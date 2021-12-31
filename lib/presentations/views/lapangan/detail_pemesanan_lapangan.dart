import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/configs/utils/NumberFormatHelper.dart';
import 'package:kuybasket/presentations/views/components/set_jam_pemesanan.dart';
import 'package:kuybasket/providers/lapangan_provider.dart';

class DetailPemesananLapangan extends StatefulWidget {
  final LapanganProvider provider;
  final GlobalKey globalKey;
  const DetailPemesananLapangan({@required this.provider, this.globalKey});

  @override
  _DetailPemesananLapanganState createState() => _DetailPemesananLapanganState();
}

class _DetailPemesananLapanganState extends State<DetailPemesananLapangan> {
  String selectedDate = 'Pilih tanggal';
  String selectedJam = 'Pilih jam';
  int totalBiaya = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Detail Pemesanan Lapangan", style: textBold,),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.date_range_rounded),
              title: Text("Tanggal Pemesanan", style: textBold,),
              subtitle: Text(selectedDate),
              trailing: Icon(Icons.arrow_forward_ios, size: 16,),
              onTap: () async{
               var selected = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2025),
                );
               setState(() {
                 selectedDate = DateFormat('dd MMM yyyy').format(selected);
                 widget.provider.dataPemesanan['tanggal'] = DateFormat('yyyy/MM/dd').format(selected);
               });
              },
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.access_time_rounded),
              title: Text("Jam Pemesanan", style: textBold,),
              subtitle: Text(selectedJam),
              trailing: Icon(Icons.arrow_forward_ios, size: 16,),
              onTap: ()async {
                var res = await showDialog(
                    context: context,
                    builder: (context){
                      return Dialog(
                        elevation: 1,
                        child: SetJamPemesanan(
                          idLapangan: widget.provider.dataPemesanan['id_lapangan'],
                          tanggal: widget.provider.dataPemesanan['tanggal'],
                        ),
                      );
                    }
                  );
                if(res != null){
                  setState(() {
                    widget.provider.dataPemesanan['jam'] = res;
                    selectedJam = res.toString();
                    totalBiaya = res.length * widget.provider.detailLapanganModel.data.dataLapangan.biayaPerJam;
                  });
                }
              },
            ),
            vSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total", style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                      ),),
                      Text("Rp "+valueRupiah(totalBiaya), style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ),
                RaisedButton(
                  color: primaryColor,
                  padding: EdgeInsets.all(16),
                  child: Text("Buat Pemesanan", style: textWhite.copyWith(fontWeight: FontWeight.bold),),
                  onPressed: (){
                    print(jsonEncode(widget.provider.dataPemesanan));
                        showDialog(
                          barrierDismissible: false,
                          context: widget.globalKey.currentContext,
                          builder: (context){
                            return AlertDialog(
                              title: Text("Konfirmasi pemesanan lapangan"),
                              actions: [
                                OutlineButton(
                                  borderSide: BorderSide(
                                    color: Colors.red
                                  ),
                                  child: Text("Batal", style: TextStyle(color: Colors.red),),
                                  onPressed: (){
                                      Navigator.pop(context);
                                  },
                                ),
                                RaisedButton(
                                  color: primaryColor,
                                  onPressed: () async{
                                    Navigator.pop(context);
                                    EasyLoading.show(status: 'loading...');
                                    String res = await widget.provider.postPemesananLapangan();
                                    EasyLoading.dismiss();
                                    if(res != ''){
                                      Navigator.pushNamedAndRemoveUntil(widget.globalKey.currentContext, '/pesanan/konfirmasi-pembayaran', (route) => route.isFirst,arguments: {'id_pemesanan' :res,'status':'0'});
                                      EasyLoading.showToast('berhasil');
                                    }else{
                                      EasyLoading.showToast('gagal, silahkan coba lagi');
                                    }

                                  },
                                  child: Text("Pesan", style: textWhite,),
                                )
                              ],
                            );
                          }
                        );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

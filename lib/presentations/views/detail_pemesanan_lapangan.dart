import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/presentations/views/components/set_jam_pemesanan.dart';
import 'package:smart_select/smart_select.dart';

class DetailPemesananLapangan extends StatelessWidget {
  const DetailPemesananLapangan({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Which holds the selected date
    /// Defaults to today's date.
    DateTime selectedDate = DateTime.now();
    // a simple usage

    List<int> value = [2];
    List<S2Choice<int>> frameworks = [
      S2Choice<int>(value: 1, title: 'Ionic'),
      S2Choice<int>(value: 2, title: 'Flutter'),
      S2Choice<int>(value: 3, title: 'React Native'),
    ];

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
              subtitle: Text("12 Februari 2002"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16,),
              onTap: () async{
                showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2025)
                );
              },
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.access_time_rounded),
              title: Text("Jam Pemesanan", style: textBold,),
              subtitle: Text("07.00, 08.00"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16,),
              onTap: (){
                  showDialog(
                    context: context,
                    builder: (context){
                      return Dialog(
                        elevation: 1,
                        child: SetJamPemesanan(),
                      );
                    }
                  );
              },
            ),
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
                      Text("Rp 200.000", style: TextStyle(
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
                        showDialog(
                          barrierDismissible: false,
                          context: context,
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
                                    await Timer(Duration(seconds: 4), (){

                                    });
                                    EasyLoading.showToast('berhasil');
                                    Navigator.pushReplacementNamed(context, '/pesanan/konfirmasi-pembayaran');
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

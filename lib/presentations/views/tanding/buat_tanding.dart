import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/providers/tanding_provider.dart';

class BuatTanding extends StatefulWidget {
  final TandingProvider provider;
  final GlobalKey globalKey;
  const BuatTanding({Key key, this.provider, this.globalKey}) : super(key: key);

  @override
  _BuatTandingState createState() => _BuatTandingState();
}

class _BuatTandingState extends State<BuatTanding> {
  String selectedDate = 'Pilih tanggal';
  String selectedJam = 'Pilih jam';
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
            Text(
              "Buat Tanding Baru",
              style: textBold,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.date_range_rounded),
              title: Text(
                "Tanggal Tanding",
                style: textBold,
              ),
              subtitle: Text(selectedDate),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
              onTap: () async {
                var selected = await DatePicker.showDateTimePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2018, 3, 5),
                    maxTime: DateTime(2019, 6, 7),
                    onConfirm: (date) {
                      print('confirm $date');
                      widget.provider.data["tgl_tanding"] = date.toString();
                    }, currentTime: DateTime.now(), locale: LocaleType.id);
                setState(() {
                  selectedDate = DateFormat('dd MMM yyyy – kk:mm').format(selected);
                  // selectedDate = selected.toString();
                  print(selectedDate);// widget.provider.data["tgl_tanding"] = selected;
                      // DateFormat('dd MMM yyyy').format(selected);
                  // widget.provider.dataPemesanan['tanggal'] = DateFormat('yyyy/MM/dd').format(selected);
                });
              },
            ),
            Divider(),
            vSpace(16),
            Center(
              child: RaisedButton(
                color: primaryColor,
                padding: EdgeInsets.all(16),
                child: Text(
                  "Buat Tanding",
                  style: textWhite.copyWith(fontWeight: FontWeight.bold),
                ),
                onPressed: () async{
                  EasyLoading.show(status: "Loading");
                 bool res = await widget.provider.buatTanding();
                 EasyLoading.dismiss();
                 if(res){
                   EasyLoading.showSuccess('Berhasil buat pertandingan');
                   Navigator.pushNamedAndRemoveUntil(context, AppRouterStrings.home, (route) => false, arguments: 1);
                 }else{
                   EasyLoading.showSuccess('Gagal buat pertandingan, silahkan coba lagi');
                 }

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

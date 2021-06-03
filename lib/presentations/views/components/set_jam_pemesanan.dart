import 'package:flutter/material.dart';
import 'package:kuybasket/configs/constants/view_state.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/presentations/views/base_view.dart';
import 'package:kuybasket/providers/lapangan_provider.dart';

class SetJamPemesanan extends StatefulWidget {
  final String idLapangan;
  final String tanggal;
  const SetJamPemesanan({@required this.idLapangan, @required this.tanggal});

  @override
  _SetJamPemesananState createState() => _SetJamPemesananState();
}

class _SetJamPemesananState extends State<SetJamPemesanan> {
  List jamSelected = [];
  @override
  Widget build(BuildContext context) {
    return BaseView<LapanganProvider>(
      onModelReady: (model)=> model.getJamKosongLapangan(idLapangan: widget.idLapangan, tanggal: widget.tanggal),
      builder: (context, provider, child){
        return
          provider.state == ViewState.Fetching ?
              Container(height: 200,child: Center(child: CircularProgressIndicator(),))
              :
          Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Pilih Jam'),
              ),
              Divider(),
              Container(
                height: 200,
                child: Scrollbar(
                  child: ListView(
                    children: List.generate(provider.listJadwalLapangan.length, (index){
                      return   CheckboxListTile(
                          title: Text(provider.listJadwalLapangan[index]['jam']),
                          value: provider.listJadwalLapangan[index]['isSelected'],
                          onChanged: (value) {
                            setState(() {
                              provider.listJadwalLapangan[index]['isSelected'] = !provider.listJadwalLapangan[index]['isSelected'];
                              if(provider.listJadwalLapangan[index]['isSelected']){
                                jamSelected.add(provider.listJadwalLapangan[index]['jam']);
                              }else{
                                jamSelected.remove(provider.listJadwalLapangan[index]['jam']);
                              }
                            });
                          });
                    }),
                  ),
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RaisedButton(
                      child: Text("Pilih", style: textWhite,),
                      color: primaryColor,
                      onPressed: () {
                        Navigator.pop(context, jamSelected);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

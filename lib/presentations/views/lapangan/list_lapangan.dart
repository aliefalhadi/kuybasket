import 'package:flutter/material.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/constants/strings.dart';
import 'package:kuybasket/configs/constants/view_state.dart';
import 'package:kuybasket/configs/utils/NumberFormatHelper.dart';
import 'package:kuybasket/models/daftar_lapangan_model.dart';
import 'package:kuybasket/presentations/views/base_view.dart';
import 'package:kuybasket/providers/dashboard_provider.dart';

class ListLapangan extends StatelessWidget {
  const ListLapangan({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardProvider>(
      onModelReady: (model)=>model.getDaftarLapangan(),
      builder: (context, provider, child){
        return Scaffold(
          appBar: AppBar(
            title: Text("Daftar Lapangan"),
          ),
          body:
          provider.state == ViewState.Fetching ?
          Center(child: CircularProgressIndicator(),)
              :
          provider.state == ViewState.ErrConnection ?
          Center(child: Text("Periksa jaringan anda"),)
              :
          Container(
            padding: EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: provider.daftarLapanganModel.data.length,
              itemBuilder: (context, index){
                DatumDaftarLapangan dataLapangan = provider.daftarLapanganModel.data[index];
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, AppRouterStrings.detailLapangan, arguments: dataLapangan.dataLapangan.idLapangan.toString());
                  },
                  child: Card(
                    margin: EdgeInsets.only(left: 0, top: 0,right: 0, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 180,
                          child: Image.network(baseImageUrl+dataLapangan.fotoLapangan[0].foto, fit: BoxFit.cover,),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(dataLapangan.dataLapangan.namaLapangan, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                              SizedBox(height: 8,),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined, color: Colors.grey, size: 16,),
                                  Text(dataLapangan.dataLapangan.alamatLapangan, style: TextStyle(color: Colors.grey),)
                                ],
                              ),
                              SizedBox(height: 16,),
                              RichText(text: TextSpan(
                                  text: 'Rp ',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                      text: valueRupiah(dataLapangan.dataLapangan.biayaPerJam),
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                    TextSpan(
                                      text: ' / Jam',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ]
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}


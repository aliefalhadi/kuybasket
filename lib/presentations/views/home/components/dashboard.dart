import 'package:flutter/material.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/constants/strings.dart';
import 'package:kuybasket/configs/constants/view_state.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/configs/utils/NumberFormatHelper.dart';
import 'package:kuybasket/models/daftar_lapangan_model.dart';
import 'package:kuybasket/presentations/views/base_view.dart';
import 'package:kuybasket/presentations/widgets/text_form_search.dart';
import 'package:kuybasket/providers/dashboard_provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardProvider>(
      onModelReady: (model)=>model.getDaftarLapangan(),
      builder: (context, provider, child){
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text("KUYBASKET", style: textBlack,),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.notifications_none_outlined,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouterStrings.notifikasi);
                    })
              ],
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
              child: ListView(children: [
                Text(
                  "Temukan Tempat\nBermainmu",
                  style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormSearch(),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Recommended",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(provider.daftarLapanganModel.data.length, (index){
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
                  }),
                ),
              ]) // This trailing comma makes auto-formatting nicer for build methods.
          )
          // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}

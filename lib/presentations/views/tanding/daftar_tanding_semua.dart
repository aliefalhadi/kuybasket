import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/constants/strings.dart';
import 'package:kuybasket/configs/constants/view_state.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/configs/utils/NumberFormatHelper.dart';
import 'package:kuybasket/presentations/views/base_view.dart';
import 'package:kuybasket/presentations/views/components/card_tanding.dart';
import 'package:kuybasket/providers/pemesanan_provider.dart';
import 'package:kuybasket/providers/tanding_provider.dart';

class DaftarTandingSemua extends StatefulWidget {
  const DaftarTandingSemua({Key key}) : super(key: key);

  @override
  _DaftarTandingSemuaState createState() => _DaftarTandingSemuaState();
}

class _DaftarTandingSemuaState extends State<DaftarTandingSemua> {
  @override
  Widget build(BuildContext context) {
    return BaseView<TandingProvider>(
      onModelReady: (model) => model.getAll(),
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
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: ListView.builder(
                      itemCount: provider.tanding.data.length,
                      itemBuilder: (context, index){
                        return CardTanding(
                          name: provider.tanding.data[index][0].user.name,
                          tgl: provider.tanding.data[index][0].tanding.tglTanding.toString(),
                        );
                          Column(
                          children: [
                            Text(provider.tanding.data[index][0].user.name)
                          ],
                        );
                      },
                    ),
                  );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kuybasket/configs/constants/view_state.dart';
import 'package:kuybasket/presentations/views/base_view.dart';
import 'package:kuybasket/presentations/views/components/card_tanding.dart';
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
                    child: Text("Belum ada data tanding"),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: ListView.builder(
                      itemCount: provider.tanding.data.length,
                      itemBuilder: (context, index){
                        return CardTanding(
                          idTanding: provider.tanding.data[index][0].tanding.idTanding.toString(),
                          name: provider.tanding.data[index][0].user.name,
                          tgl: provider.tanding.data[index][0].tanding.tglTanding,
                        );
                      },
                    ),
                  );
      },
    );
  }
}

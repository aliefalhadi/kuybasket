import 'package:flutter/material.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/presentations/views/base_view.dart';
import 'package:kuybasket/presentations/views/pemesanan/daftar_pemesanan_berlangsung.dart';
import 'package:kuybasket/presentations/views/pemesanan/daftar_pemesanan_selesai.dart';
import 'package:kuybasket/presentations/views/tanding/buat_tanding.dart';
import 'package:kuybasket/presentations/views/tanding/daftar_tanding_saya.dart';
import 'package:kuybasket/presentations/views/tanding/daftar_tanding_semua.dart';
import 'package:kuybasket/providers/tanding_provider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DaftarTanding extends StatefulWidget {
  const DaftarTanding({Key key}) : super(key: key);

  @override
  _DaftarTandingState createState() => _DaftarTandingState();
}

class _DaftarTandingState extends State<DaftarTanding> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BaseView<TandingProvider>(
      builder: (context, provider, child){
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              return showMaterialModalBottomSheet(
                context: context,
                  builder: (context) {
                    return BuatTanding(provider: provider);
                  });
            },
          ),
          backgroundColor: Colors.white,
          appBar: AppBar(
            bottom:  PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: TabBar(
                  unselectedLabelColor: Colors.black54,
                  labelColor: Colors.white,
                  indicatorColor: Colors.white,
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(
                      text: "Semua",
                    ),
                    Tab(
                      text: "Saya",
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              DaftarTandingSemua(),
              DaftarTandingSaya()
            ],
          ),
        );
      },
    );

  }
}

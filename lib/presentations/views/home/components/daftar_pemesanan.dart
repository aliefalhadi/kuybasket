import 'package:flutter/material.dart';
import 'package:kuybasket/presentations/views/pemesanan/daftar_pemesanan_berlangsung.dart';
import 'package:kuybasket/presentations/views/pemesanan/daftar_pemesanan_selesai.dart';

class DaftarPemesanan extends StatefulWidget {
  const DaftarPemesanan({Key key}) : super(key: key);

  @override
  _DaftarPemesananState createState() => _DaftarPemesananState();
}

class _DaftarPemesananState extends State<DaftarPemesanan> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  text: "Berlangsung",
                ),
                Tab(
                  text: "Selesai",
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          DaftarPemesananBerlangsung(),
          DaftarPemesananSelesai(),
        ],
      ),
    );
  }
}

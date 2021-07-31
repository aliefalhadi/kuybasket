import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/presentations/views/home/components/daftar_pemesanan.dart';
import 'package:kuybasket/presentations/views/home/components/dashboard.dart';

import 'components/profile.dart';

class Index extends StatefulWidget {
  const Index({Key key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> with SingleTickerProviderStateMixin{
  int _currentIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        onTap: (index){
          setState(() {
            _currentIndex = index;
            _tabController.index = index;
          });
        },
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: new Icon(FontAwesome.globe),
            label: 'Tanding',
          ),
          BottomNavigationBarItem(
            icon: new Icon(FontAwesome.ticket),
            label: 'Pemesanan',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Dashboard(),
          Text("Tanding"),
          DaftarPemesanan(),
          Profile()
        ],
      ),
    );
  }
}

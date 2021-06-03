import 'package:flutter/material.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';

class KonfirmasiPembayaran extends StatelessWidget {
  const KonfirmasiPembayaran({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff28903b),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 38,
              backgroundColor: Colors.lightGreen,
              child: Icon(Icons.check, size: 40, color: Colors.white,),
            ),
            SizedBox(height: 16,),
            Text("Selamat alief alhadi, Pesanan Kamu Telah berhasil dibuat", style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 16,),
            Text("Selesaikan pemabayaran sebelum", style: TextStyle(
                color: Colors.white,
                fontSize: 16
            ),),
            SizedBox(height: 16,),
            Text("13 Februari 2020", style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 16,),
            Card(
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTileInfo(),
                  Divider(),
                  Container(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("BRI (a.n. Alief alhadi)"),
                          subtitle: Text("101010-19010-1010"),
                          trailing: IconButton(
                            icon: Icon(Icons.copy),
                            onPressed: (){},
                          ),
                        ),
                        ListTile(
                          title: Text("BRI (a.n. Alief alhadi)"),
                          subtitle: Text("101010-19010-1010"),
                          trailing: IconButton(
                            icon: Icon(Icons.copy),
                            onPressed: (){},
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16,),
            Center(child: Text("Silahkan transfer biaya pemesanan ke nomor rekening yang ada di atas", style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              decoration: TextDecoration.underline
            ),)),
            SizedBox(height: 16,),
            RaisedButton(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              onPressed: (){},
              child: Text("Upload Bukti Pembayaran", style: textBold,),
            ),
            SizedBox(height: 8,),
            OutlineButton(
              padding: EdgeInsets.all(16),
              borderSide: BorderSide(
                color: Colors.white
              ),
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Kembali ke Beranda",style: textBold.copyWith(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}

class ListTileInfo extends StatelessWidget {
  const ListTileInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ID Pemabyaran"),
          SizedBox(height: 8,),
          Text("SA-797979AX", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
          ),),
          SizedBox(height: 16,),
          Text("Total biaya"),
          SizedBox(height: 8,),
          Text("Rp 200.000", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
          ),),
        ],
      ),
    );
  }
}

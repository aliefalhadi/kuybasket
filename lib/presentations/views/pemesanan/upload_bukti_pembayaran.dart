import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';
import 'package:kuybasket/presentations/views/base_view.dart';
import 'package:kuybasket/providers/pemesanan_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadBuktiPembayaran extends StatefulWidget {
  final String idPemesanan;
  const UploadBuktiPembayaran({this.idPemesanan});

  @override
  _UploadBuktiPembayaranState createState() => _UploadBuktiPembayaranState();
}

class _UploadBuktiPembayaranState extends State<UploadBuktiPembayaran>
    with SingleTickerProviderStateMixin {
  List<File> image = [];
  final picker = ImagePicker();

  getImageFile(ImageSource source) async {
    var imagePath = await picker.getImage(
        source: source, imageQuality: 70, maxHeight: 640, maxWidth: 640);
    //  simpan gambar dari kamera di shared supaya ketika keluar aplikasi gambar tidak hilang
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('gambarPengaduan', imagePath.path);

    File croppedImage = await ImageCropper.cropImage(
      sourcePath: imagePath.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
      ],
    );
    setState(() {
      image.add(croppedImage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<PemesananProvider>(
      builder: (context, provider, child){
        return Scaffold(
          appBar: AppBar(
            title: Text("Upload Pembayaran"),
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: [
                Container(
                  child: Text(
                    "Tambahkan bukti pembayaran anda",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                vSpace(8),
                FittedBox(
                  child: image.length < 1
                      ? InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title:
                                new Text("Tambah foto bukti pembayaran"),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          Navigator.pop(context);

                                          getImageFile(ImageSource.camera);
                                        },
                                        leading: Icon(Icons.camera_alt),
                                        title: Text("Ambil dari Kamera"),
                                      ),
                                      ListTile(
                                        onTap: () {
                                          Navigator.pop(context);

                                          getImageFile(ImageSource.gallery);
                                        },
                                        leading: Icon(Icons.image),
                                        title: Text("Pilih dari Galeri"),
                                      )
                                    ],
                                  ),
                                ));
                          });
                    },
                    child: Container(
                      color: Colors.grey,
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      child: Center(
                        child: Icon(
                          Icons.image,
                          size: 48,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                  )
                      : Image(
                    image: FileImage(image[0]),
                    fit: BoxFit.cover,
                  ),
                ),
                vSpace(21),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    child: Text("Kirim", style: textWhite,),
                    onPressed: () async{
                        EasyLoading.show(status: "Loading");
                        var res = await provider.postUploadBuktiPembayaran(image, widget.idPemesanan);
                        EasyLoading.dismiss();
                        if(res){
                          EasyLoading.showToast('Berhasil upload bukti pembayaran');
                          Navigator.pushNamedAndRemoveUntil(context, AppRouterStrings.home, (route) => false,arguments: 2);
                        }else{
                          EasyLoading.showToast('Gagal');
                        }
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

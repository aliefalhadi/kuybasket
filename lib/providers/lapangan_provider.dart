import 'dart:convert';
import 'dart:io';

import 'package:kuybasket/configs/constants/view_state.dart';
import 'package:kuybasket/configs/utils/shared_preference_helper.dart';
import 'package:kuybasket/locator.dart';
import 'package:kuybasket/models/daftar_lapangan_model.dart';
import 'package:kuybasket/models/detail_lapangan_model.dart';
import 'package:kuybasket/models/jadwal_lapangan_by_tanggal_model.dart';
import 'package:kuybasket/providers/base_provider.dart';
import 'package:kuybasket/services/lapangan_service.dart';

class LapanganProvider extends BaseProvider{
  DetailLapanganModel detailLapanganModel;
  JadwalLapanganByTanggalModel jadwalLapanganByTanggalModel;
  List listJadwalLapangan;
  LapanganService _lapanganService = locator<LapanganService>();
  int indexFotoActive = 0;

  Map dataPemesanan = {
    "id_user":"",
    "id_lapangan":"",
    "tanggal":"",
    "jam":[]
  };

  Future getDetailLapangan(String idLapangan) async {
    try {
      setState(ViewState.Fetching);
      detailLapanganModel  = await _lapanganService.getDetailLapangan(idLapangan);

      this.dataPemesanan['id_user'] = await locator<SharedPreferencesHelper>().getValue('idUser');
      this.dataPemesanan['id_lapangan'] = idLapangan;

      setState(ViewState.Idle);
    }  on SocketException catch(e){
      setState(ViewState.ErrConnection);
    }
    catch (e) {
      if(e == 404 || e == 502 || e == 503){
        setState(ViewState.ErrConnection);
      }else{
        setState(ViewState.FetchNull);
      }
    }
  }

  void changedActiveFoto(int index){
    this.indexFotoActive = index;
    notifyListeners();
  }

  Future getJamKosongLapangan({String idLapangan, String tanggal}) async {
    try {
      this.listJadwalLapangan = [];
      setState(ViewState.Fetching);
      jadwalLapanganByTanggalModel  = await _lapanganService.getJamKosongLapangan(idLapangan: idLapangan, tanggal: tanggal);

      jadwalLapanganByTanggalModel.data.forEach((data) {
        this.listJadwalLapangan.add({
          'jam' : data.jam.substring(0,5),
          'isSelected' : false,
        });
      });

      print(this.listJadwalLapangan);

      setState(ViewState.Idle);
    }  on SocketException catch(e){
      setState(ViewState.ErrConnection);
    }
    catch (e) {
      if(e == 404 || e == 502 || e == 503){
        setState(ViewState.ErrConnection);
      }else{
        setState(ViewState.FetchNull);
      }
    }
  }

  Future<String> postPemesananLapangan() async{
    try {
      //      ubah array menjadi string
      var res = await _lapanganService.postPemesananLapangan(jsonEncode(dataPemesanan));

      return res.data['id_pemesanan'].toString();
    } on SocketException catch(e){
      return '';
    }
    catch (e) {
      return '';
    }
  }
}
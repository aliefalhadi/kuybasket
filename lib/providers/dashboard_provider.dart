import 'dart:io';

import 'package:kuybasket/configs/constants/view_state.dart';
import 'package:kuybasket/locator.dart';
import 'package:kuybasket/models/daftar_lapangan_model.dart';
import 'package:kuybasket/models/detail_lapangan_model.dart';
import 'package:kuybasket/providers/base_provider.dart';
import 'package:kuybasket/services/lapangan_service.dart';

class DashboardProvider extends BaseProvider{
  DaftarLapanganModel daftarLapanganModel;
  DetailLapanganModel detailLapanganModel;
  LapanganService _lapanganService = locator<LapanganService>();

  Future getDaftarLapangan() async {
    try {
      setState(ViewState.Fetching);
      daftarLapanganModel  = await _lapanganService.getDaftarLapangan();

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


  Future getDetailLapangan(String idLapangan) async {
    try {
      setState(ViewState.Fetching);
      detailLapanganModel  = await _lapanganService.getDetailLapangan(idLapangan);

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
}
import 'dart:io';

import 'package:kuybasket/configs/constants/view_state.dart';
import 'package:kuybasket/locator.dart';
import 'package:kuybasket/models/daftar_pemesanan_model.dart';
import 'package:kuybasket/models/detail_pemesanan_model.dart';
import 'package:kuybasket/providers/base_provider.dart';
import 'package:kuybasket/services/pemesanan_service.dart';

class PemesananProvider extends BaseProvider {
  DaftarPemesananModel daftarPemesananModel;
  DetailPemesananModel detailPemesananModel;
  PemesananService _pemesananService = locator<PemesananService>();

  Future getDaftarPemesanan({String status}) async {
    try {
      setState(ViewState.Fetching);
      daftarPemesananModel =
          await _pemesananService.getDaftarPemesanan(status: status);

      if (daftarPemesananModel.data.isEmpty ||
          daftarPemesananModel.data == []) {
        setState(ViewState.FetchNull);
      }else{
        setState(ViewState.Idle);
      }
    } on SocketException catch (e) {
      setState(ViewState.ErrConnection);
    } catch (e) {
      if (e == 404 || e == 502 || e == 503) {
        setState(ViewState.ErrConnection);
      } else {
        setState(ViewState.FetchNull);
      }
    }
  }

  Future getDetailPemesanan({String idPemesanan}) async {
    try {
      setState(ViewState.Fetching);
      detailPemesananModel =
          await _pemesananService.getDetailPemesanan(idPemesanan: idPemesanan);

      setState(ViewState.Idle);
    } on SocketException catch (e) {
      setState(ViewState.ErrConnection);
    } catch (e) {
      if (e == 404 || e == 502 || e == 503) {
        setState(ViewState.ErrConnection);
      } else {
        setState(ViewState.FetchNull);
      }
    }
  }
}

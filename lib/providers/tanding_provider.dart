import 'dart:convert';
import 'dart:io';

import 'package:kuybasket/configs/constants/view_state.dart';
import 'package:kuybasket/configs/utils/shared_preference_helper.dart';
import 'package:kuybasket/models/detail_tanding_model.dart';
import 'package:kuybasket/models/tanding_model.dart';
import 'package:kuybasket/providers/base_provider.dart';
import 'package:kuybasket/services/tanding_service.dart';

import '../locator.dart';

class TandingProvider extends BaseProvider{
  Tanding tanding;
  DetailTandingModel detailTandingModel;
  TandingService tandingService = TandingService();
  bool isTandingSaya = false;
  bool isGabung = false;
  Map data = {
    "user_id" : "",
    "tgl_tanding" : ""
  };

  Future<void> getAll() async {
    try {
      setState(ViewState.Fetching);
      tanding = await tandingService.getTanding();

      setState(ViewState.Idle);
    }  on SocketException catch(e){
      print(e.toString());
      setState(ViewState.ErrConnection);
    }
    catch (e) {
      if(e == 404 || e == 502 || e == 503){
        setState(ViewState.ErrConnection);
      }else{
        print(e.toString());
        setState(ViewState.FetchNull);
      }
    }
  }

  Future<bool> buatTanding() async {
    try {
      var id =  await locator<SharedPreferencesHelper>().getValue('idUser');

      data["user_id"] = id;
      tanding = await tandingService.postBuatTanding(data);
      // if(tanding.data.isEmpty){
      //   setState(ViewState.FetchNull);
      // }
      return true;
    }  on SocketException catch(e){
      print(e.toString());
      return false;
    }
    catch (e) {
      if(e == 404 || e == 502 || e == 503){
        return false;
      }else{
        print(e.toString());
        return false;
      }
    }
  }

  Future<void> getTandingSaya() async {
    try {
      setState(ViewState.Fetching);
      var id =  await locator<SharedPreferencesHelper>().getValue('idUser');

      tanding = await tandingService.getTandingSaya(id);


      setState(ViewState.Idle);
    }  on SocketException catch(e){
      print(e.toString());
      setState(ViewState.ErrConnection);
    }
    catch (e) {
      if(e == 404 || e == 502 || e == 503){
        setState(ViewState.ErrConnection);
      }else{
        print(e.toString());
        setState(ViewState.FetchNull);
      }
    }
  }


  Future<void> getDetail(String idTanding) async {
    try {
      setState(ViewState.Fetching);
      detailTandingModel = await tandingService.getDetail(idTanding);

      var id =  await locator<SharedPreferencesHelper>().getValue('idUser');

      if(detailTandingModel.data.user.id.toString() == id){
        print('asdsd');
        this.isTandingSaya = true;
      }else{
        if(detailTandingModel.data.lawan.isNotEmpty){
         int indexSaya = detailTandingModel.data.lawan.indexWhere((data) => data.user.id.toString() == id);
         if(indexSaya > -1){
           if(detailTandingModel.data.lawan[indexSaya].tandingLawan.status == 1){
             this.isTandingSaya = true;
           }
           this.isGabung = true;
         }
        }
      }

      setState(ViewState.Idle);
    }  on SocketException catch(e){
      print(e.toString());
      setState(ViewState.ErrConnection);
    }
    catch (e) {
      if(e == 404 || e == 502 || e == 503){
        setState(ViewState.ErrConnection);
      }else{
        print(e.toString());
        setState(ViewState.FetchNull);
      }
    }
  }


  Future<bool> buatJoin() async {
    try {
      var id =  await locator<SharedPreferencesHelper>().getValue('idUser');

      Map dataJoin = {
        "user_id" : id,
        "tanding_id" :this.detailTandingModel.data.tanding.idTanding.toString()
      };

      await tandingService.postJoin(jsonEncode(dataJoin));

      return true;
    }  on SocketException catch(e){
      print(e.toString());
      return false;
    }
    catch (e) {
      if(e == 404 || e == 502 || e == 503){
        return false;
      }else{
        print(e.toString());
        return false;
      }
    }
  }


  Future<bool> buatPilihLawan(String idLawan) async {
    try {

      Map dataJoin = {
        "id_tanding" : this.detailTandingModel.data.tanding.idTanding.toString(),
        "user_id_lawan" : idLawan,
      };

      await tandingService.postPilihLawan(jsonEncode(dataJoin));

      return true;
    }  on SocketException catch(e){
      print(e.toString());
      return false;
    }
    catch (e) {
      if(e == 404 || e == 502 || e == 503){
        return false;
      }else{
        print(e.toString());
        return false;
      }
    }
  }

}
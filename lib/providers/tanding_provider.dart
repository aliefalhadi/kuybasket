import 'dart:convert';
import 'dart:io';

import 'package:kuybasket/configs/constants/view_state.dart';
import 'package:kuybasket/configs/utils/shared_preference_helper.dart';
import 'package:kuybasket/models/tanding_model.dart';
import 'package:kuybasket/providers/base_provider.dart';
import 'package:kuybasket/services/tanding_service.dart';

import '../locator.dart';

class TandingProvider extends BaseProvider{
  Tanding tanding;
  TandingService tandingService = TandingService();
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

  Future<void> buatTanding() async {
    try {
      setState(ViewState.Fetching);
      var id =  await locator<SharedPreferencesHelper>().getValue('idUser');
      print("id $id");
      data["user_id"] = id;
      tanding = await tandingService.postBuatTanding(data);
      // if(tanding.data.isEmpty){
      //   setState(ViewState.FetchNull);
      // }
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

  Future<void> getTandingSaya() async {
    try {
      setState(ViewState.Fetching);
      var id =  await locator<SharedPreferencesHelper>().getValue('idUser');
      print("id $id");
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



}
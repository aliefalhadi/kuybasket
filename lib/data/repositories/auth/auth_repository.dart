import 'package:dio/dio.dart';
import 'package:kuybasket/data/data_providers/auth/auth_data_provider.dart';

class AuthRepository{
  AuthDataProvider _authDataProvider = AuthDataProvider();

  Future<bool> postRegisterUser(var data) async{
    Response response = await _authDataProvider.postRegisterUser(data);

    if(response.statusCode == 201){
      return true;
    }else{
      return false;
    }
  }
}
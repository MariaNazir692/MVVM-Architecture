
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetwrokApiServices.dart';
import 'package:mvvm/res/app_urls.dart';

class AuthRepository{

final BaseApiService _apiService=NetworkApiService();

Future<dynamic> loginApi(dynamic data)async{
  try{
    dynamic response=await _apiService.getpostApiResponse(AppUrl.loginUrl, data);
    return response;
  }catch(e){
    throw e;
  }
}
Future<dynamic> signUpApi(dynamic data)async{
  try{
    dynamic response=await _apiService.getApiResponse(AppUrl.signUpUrl);
    return response;
  }catch(e){
    throw e;

  }
}


}
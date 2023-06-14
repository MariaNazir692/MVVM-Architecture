import 'dart:convert';
import 'dart:io';

import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:http/http.dart'as http;

class NetworkApiService extends BaseApiService{


  @override
  Future getApiResponse(String url)async {

    dynamic responseJson;
   try{
     //get the target api call if there is not any response then after 10 seconds session will end
     final response=await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

     //returnResponse check the response status code either the request is successfully or error
     //is there is an error then we will throw an exception to the user that something is not right
     responseJson=returnResponse(response);

   }on SocketException{
     throw fetchDataException("No Internet Connection");
   }
    return responseJson;
  }

  @override
  Future getpostApiResponse(String url, dynamic data)async {
    dynamic responseJson;
    try{
      //post data or target api which is the body
      http.Response response=await http.post(
          Uri.parse(url), 
        body: data,
      ).timeout(const Duration(seconds: 10));
      responseJson=returnResponse(response);

    }on SocketException{
      throw fetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic jsonResponse=jsonDecode(response.body);
        return jsonResponse;
      case 400:
        throw badRequestException(response.statusCode.toString());
        return;
      case 404:
        throw unAuthorizedException(response.statusCode.toString());
        return;
      default:
        throw fetchDataException("Error during communicating with server" + "with status code"+ response.statusCode.toString());

    }
  }

}
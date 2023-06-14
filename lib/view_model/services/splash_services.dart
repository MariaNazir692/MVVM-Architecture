import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/user_view_model.dart';

class SplashServices{
  //this will get all user data so that we can check his/her shared preferences
  Future<UserModel> getUserData()=>UserViewModel().getUser();

  void checkAuthentication(BuildContext context)async{
    getUserData().then((value) async {
      if(value.token=='null' || value.token==''){
         Future.delayed(Duration(seconds: 2));
        Navigator.pushNamed(context, RoutesName.login);
        if(kDebugMode){
          print(value.token.toString());
        }
      }else{
         Future.delayed(Duration(seconds: 2));
        Navigator.pushNamed(context, RoutesName.home);
         if(kDebugMode){
           print(value.token.toString());
         }
      }
    });
  }
}
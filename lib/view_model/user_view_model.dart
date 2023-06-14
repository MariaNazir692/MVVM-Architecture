// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:mvvm/model/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class UserViewModel with ChangeNotifier{
//
// Future<bool> saveUser(UserModel model)async{
//   //initiate the shared preference to store the user's data to device for the sake of session management
//   final SharedPreferences sp=await SharedPreferences.getInstance();
//   //this will get the usr token from usermodel class which is given to user after the user login to app
//   sp.setString('token', model.token.toString());
//   if(kDebugMode){
//     print(model.token.toString());
//   }
//   //this will notify the call f function and save data to the shared preference
//   notifyListeners();
//   return true;
// }
//
// Future<UserModel> getUser()async{
//
//   SharedPreferences sp=await SharedPreferences.getInstance();
//   //getting data from shared preference
//   final String? token=sp.getString('token');
//   if(kDebugMode){
//     print(token);
//   }
//   return UserModel(
//     token: token.toString()
//   );
// }
//
// Future<bool> removeUser()async{
//   SharedPreferences sp=await SharedPreferences.getInstance();
//   sp.remove('token');
//   //removing data from shared preferences
//   return true;
//
// }
//
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel model) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', model.token.toString());
    if (kDebugMode) {
      print(model.token.toString());
    }
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    if (kDebugMode) {
      print(token);
    }
    return UserModel(token: token.toString());
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}

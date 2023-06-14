import 'package:flutter/cupertino.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier{

  final _myrepo=AuthRepository();

   bool _loading = false;
   bool get loading=>_loading;
   setloading(bool value){
     _loading=value;
     notifyListeners();
   }

  bool _signUploading = false;
  bool get signUploading=>_signUploading;
  setSignUploading(bool value){
    _signUploading=value;
    notifyListeners();
  }


  Future<void> loginApi(dynamic data, BuildContext context)async{
     setloading(true);
    _myrepo.loginApi(data).then((value){
      setloading(false);
      final userPreference=Provider.of<UserViewModel>(context,listen: false);
      userPreference.saveUser(
        UserModel(
          token: value['token'].toString()
        )
      );
     // Utils.flushBarErrorMessage('Login Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace){
      setloading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
    

  }

  Future<void> signUpApi(dynamic data, BuildContext context)async{
    setSignUploading(true);
    _myrepo.signUpApi(data).then((value){
      setSignUploading(false);
      Utils.flushBarErrorMessage('Register Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);

    }).onError((error, stackTrace){
      setloading(false);
      Utils.flushBarErrorMessage(error.toString(), context);

    });


  }

}
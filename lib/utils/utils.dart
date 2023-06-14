
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/color.dart';

import '../res/color.dart';
import '../res/color.dart';

//this will contain the utilites of project
class Utils {

  static fieldFocusChange(BuildContext context, FocusNode currentNode, FocusNode nextNode){
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);

  }

  static toastMessage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.black45,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(20),
          flushbarPosition: FlushbarPosition.TOP,
          reverseAnimationCurve: Curves.easeInOut,
          icon: Icon(Icons.error_outline,size: 30,color: AppColor.whiteColor,),
          borderRadius: BorderRadius.circular(20),
          message: message,
          messageColor: Colors.white,
          backgroundColor: Colors.black45,
          duration: Duration(seconds: 5),
        )..show(context));
  }

  static snakbar(String msg, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg, style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.black45,

    ));
  }
}

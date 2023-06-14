import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view/signup_view.dart';
import 'package:mvvm/view/splash_view.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.splash_view:
        return MaterialPageRoute(builder: (BuildContext context)=>const SplashScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>const LogInView());
      case RoutesName.SignUp:
        return MaterialPageRoute(builder: (BuildContext context)=>const SignUpScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("No Route Defined"),
            ),
          );
        });


    }
  }
}
import 'dart:io';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/utils.dart';
import '../res/components/round_btn.dart';
import '../utils/routes/routes_name.dart';
class LogInView extends StatefulWidget {
  const LogInView({Key? key}) : super(key: key);
  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {

  ValueNotifier<bool> _obsecuredPassword=ValueNotifier<bool>(true);

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  FocusNode emailFocusNode=FocusNode();
  FocusNode passwordFocusNode=FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _obsecuredPassword.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    emailFocusNode.dispose();


  }


  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel=UserViewModel();
    final height=MediaQuery.of(context).size.height*1;
    final authViewModel=Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                focusNode: emailFocusNode,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder()
                ),
                onFieldSubmitted: (vlaue){
                  Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
                },
              ),
            ),
            SizedBox(height: height*0.030,),

            ValueListenableBuilder(
                valueListenable: _obsecuredPassword,
                builder: (context, vlaue, child){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      focusNode: passwordFocusNode,
                      controller: passwordController,
                      obscureText: _obsecuredPassword.value,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),
                          suffixIcon: InkWell(
                              onTap: (){
                                _obsecuredPassword.value=!_obsecuredPassword.value;
                              },
                              child: _obsecuredPassword.value? Icon(Icons.visibility_off):Icon(Icons.visibility))
                      ),
                    ),
                  );
                }
            ),
            SizedBox(height: height*0.080,),
            RoundButton(
               text: 'Log In',
              loading: authViewModel.loading,
              onPress: (){
                 if(emailController.text.isEmpty){
                   Utils.flushBarErrorMessage('Please Enter Email', context);
                 }else if(passwordController.text.isEmpty){
                   Utils.flushBarErrorMessage('Please Enter Password', context);
                 }else if(passwordController.text.length<6){
                   Utils.flushBarErrorMessage('Please Enter 6 digit Password', context);
                 }else{
                   Map data={
                     'email':emailController.text,
                     'password':passwordController.text
                   };
                    authViewModel.loginApi(data, context);
                   // Utils.toastMessage('login');
                 }
              },

            ),
            SizedBox(height: height*0.050,),
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, RoutesName.SignUp);
              },
              child: Text.rich(
                  TextSpan(
                text: "Don't have an account",
                style: TextStyle(
                  color: Colors.black
                ),
                children: [
                 TextSpan(
                   text: "Sign Up",
                   style: TextStyle(
                     color: Colors.blue
                   )
                 )
                ]

              )),
            )

          ],
        ),
      ),
    );
  }
}
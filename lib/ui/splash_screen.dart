import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:isekaitec/helpers/shared_preference_helper.dart';
import 'package:isekaitec/ui/sign_in_screen.dart';
import 'package:isekaitec/ui/success_screen.dart';
import '../utils/utility.dart';
import 'CircularProgressIndicatorApp.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
  bool autoLogin = false;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) async {
      timer.cancel();
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        autoLogin = await sharedPreferenceHelper.getAutoLogin();
        if(autoLogin)
          {
            Navigator.pushReplacement(context, Utility.createCustomRoute(HomeScreen()));
          }
        else
          {
            Navigator.pushReplacement(context, Utility.createCustomRoute(const SignInScreen()));
          }

      } else {
        //Utility.showSnackbar(context, "Please check your internet connection");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/media/app_logo.png",
              height: 42.00,
              width: 160.00,
              fit: BoxFit.fill,
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: CircularProgressIndicatorApp(),
          )
        ]));
  }
}

import 'dart:async';

import 'package:flutter_profile_page/Constant/Constant.dart';
import 'package:flutter_profile_page/Screens/SplashScreen.dart';
import 'package:flutter_profile_page/Screens/ProfilePage.dart';



import 'package:flutter/material.dart';


main() {
  runApp(new MaterialApp(
    title: 'Fluter Profile Page',
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
        primaryColor: Color(0xff0082CD),

        primaryColorDark: Color(0xff0082CD)),
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      //SPLASH_SCREEN: (BuildContext context) => new MapScreen(),
      PROFILE: (BuildContext context) => new ProfilePage(),
    },
  ));
}

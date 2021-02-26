import 'package:flutter/material.dart';
import 'package:food_ordering/ui/screen/home_screen/home_screen.dart';
import 'package:food_ordering/ui/screen/splash_screen/splash_screen.dart';

class MyRoute{
  static const String  splashScreen = '/splash';
  static const String  homeScreen = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case splashScreen: 
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case homeScreen: 
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default: 
        return PageRouteBuilder(
          pageBuilder: null
          );
    }
  }
}
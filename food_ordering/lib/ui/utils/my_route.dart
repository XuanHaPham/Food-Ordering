import 'package:flutter/material.dart';
import 'package:food_ordering/ui/screens/home_screen/home_screen.dart';
import 'package:food_ordering/ui/screens/sign_in_screen/sign_in_screen.dart';
import 'package:food_ordering/ui/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class MyRoute {
  static const String splashScreen = '/';
  static const String homeScreen = '/home';
  static const String signInScreen = '/sign_in';

  static List<GetPage> pageList = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: signInScreen,
      page: () => SignInSCreen(),
    ),
  ];

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => SignInSCreen());
      default:
        return PageRouteBuilder(pageBuilder: null);
    }
  }
}

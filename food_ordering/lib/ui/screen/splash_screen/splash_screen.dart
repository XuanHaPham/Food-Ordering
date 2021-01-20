import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_ordering/ui/screen/sign_in_screen/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => SignInSCreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _getSplashScreenGradientColors(),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.food_bank_outlined,
              color: Colors.white,
              size: 120,
            ),
            Text(
              "Yummy",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Color> _getSplashScreenGradientColors() {
    return [
      Color.fromRGBO(245, 25, 41, 1),
      Color.fromRGBO(67, 1, 16, 1),
    ];
  }
}

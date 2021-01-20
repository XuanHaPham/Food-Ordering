import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering/ui/screen/home_screen/home_screen.dart';

class SignInSCreen extends StatefulWidget {
  SignInSCreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInSCreen> {
  var _showPassword;
  @override
  void initState() {
    super.initState();
    _showPassword = false;
    // Future.delayed(Duration(seconds: 5), () {
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    // });
  }

  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.w),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: [
            SizedBox(
              height: 50.h,
            ),
            Icon(
              Icons.food_bank_outlined,
              color: Colors.red,
              size: 120,
            ),
            Text(
              "Yummy, Welcome Back !",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              "Login to continue!",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Text("Email ID"),
            SizedBox(
              height: 5.h,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[700],
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                onChanged: (value) {},
                style: TextStyle(
                  fontSize: 14.sp,
                ),
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                  isDense: true,
                  hintStyle:
                      TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                  focusColor: Colors.blue,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(width: 1.w, color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(width: 1.w, color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(width: 1.w, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text("Password"),
            SizedBox(
              height: 5.h,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[700],
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: TextFormField(
                textInputAction: TextInputAction.done,
                obscureText: !_showPassword,
                cursorColor: Colors.red,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  isDense: true,
                  hintStyle:
                      TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                  focusColor: Colors.blue,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(width: 1.w, color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(width: 1.w, color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(width: 1.w, color: Colors.white),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _togglevisibility();
                    },
                    child: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

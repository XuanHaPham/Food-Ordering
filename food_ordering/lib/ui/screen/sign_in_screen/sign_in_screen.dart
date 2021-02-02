import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering/ui/screen/home_screen/home_screen.dart';
import 'package:food_ordering/ui/screen/register_screen/register_screen.dart';
import 'package:food_ordering/ui/screen/sign_in_screen/widgets/sign_in_with_google.dart';
import 'package:get/get.dart';

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
  }

  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage("assets/images/miscs/bg.jpg"),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.w),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: [
                SizedBox(
                  height: 30.h,
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
                  height: 10.h,
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
                    keyboardType: TextInputType.emailAddress,
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
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[700],
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_showPassword,
                    cursorColor: Colors.red,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Enter your password",
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
                      suffixIconConstraints: BoxConstraints(),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _togglevisibility();
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(HomeScreen());
                  },
                  child: Ink(
                    child: Container(
                      height: 35.h,
                      margin: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 20.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Color.fromRGBO(245, 25, 41, 1),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Or",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        signInWithGoogle().then((result) {
                          if (result != null) {
                            Get.to(HomeScreen());
                          }
                        });
                      },
                      child: Container(
                        height: 35.h,
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(color: Colors.grey),
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/miscs/g.png",
                              height: 20.h,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "Google",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 35.h,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Colors.blue,
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/miscs/fb.png",
                            height: 20.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Facebook",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not yet a member,",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(RegisterScreen());
                      },
                      child: Text(
                        " Sign up",
                        style: TextStyle(
                          color: Color.fromRGBO(245, 25, 41, 1),
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  CustomerAccount _account = new CustomerAccount();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Stack(
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
              padding: EdgeInsets.all(20.w),
              child: Column(
                // shrinkWrap: true,
                // padding: const EdgeInsets.all(20.0),
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
                    "Welcome to Yummy!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: Container(
                          height: 35.h,
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
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
                          borderRadius: BorderRadius.circular(20.r),
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
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 1,
                        color: Colors.grey[500],
                      )),
                      SizedBox(
                        width: 15,
                      ),
                      Text("OR"),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 1,
                        color: Colors.grey[500],
                      )),
                    ],
                  ),
                  Expanded(child: _buildRegisteForm())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisteForm() {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            onChanged: (value) {
              _account.fullName = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your name!';
              }
              return null;
            },
            style: TextStyle(
              fontSize: 14.sp,
            ),
            decoration: _textFormFielsDecoration("Full Name"),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              _account.phoneNumber = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your Phone number!';
              }
              return null;
            },
            style: TextStyle(
              fontSize: 14.sp,
            ),
            decoration: _textFormFielsDecoration("Mobile No."),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            onChanged: (value) {
              _account.userName = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your Username!';
              }
              return null;
            },
            style: TextStyle(
              fontSize: 14.sp,
            ),
            decoration: _textFormFielsDecoration("Username"),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            onChanged: (value) {
              _account.password = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your Password!';
              }
              return null;
            },
            style: TextStyle(
              fontSize: 14.sp,
            ),
            decoration: _textFormFielsDecoration("Password"),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            onChanged: (value) {},
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter Confirm Password!';
              }
              if(value != _account.password){
                return 'Password confirm not map password!';
              }
              return null;
            },
            style: TextStyle(
              fontSize: 14.sp,
            ),
            decoration: _textFormFielsDecoration("Confirm Password"),
          ),
          InkWell(
            onTap: () {
              if (_formKey.currentState.validate()) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
            child: Ink(
              child: Container(
                height: 35.h,
                margin: EdgeInsets.symmetric(vertical: 20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color.fromRGBO(245, 25, 41, 1),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Register Now!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
             padding: EdgeInsets.only(
             bottom: MediaQuery.of(context).viewInsets.bottom))
        ],
      ),
    );
  }

  InputDecoration _textFormFielsDecoration(String title) {
    return InputDecoration(
      labelText: title,
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 10),
      isDense: true,
      hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
      focusColor: Colors.blue,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(width: 1.w, color: Colors.grey[500]),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(width: 1.w, color: Colors.grey[500]),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(width: 1.w, color: Colors.grey[500]),
      ),
    );
  }
}

class CustomerAccount {
  String fullName;
  String userName;
  String phoneNumber;
  String password;
  CustomerAccount({this.fullName, this.password, this.phoneNumber, this.userName});
}


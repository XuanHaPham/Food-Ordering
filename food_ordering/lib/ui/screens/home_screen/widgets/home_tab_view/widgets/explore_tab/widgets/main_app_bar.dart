import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget{
  MainAppBar({Key key}) : super(key: key);

  @override
  _MainAppBarState createState() => _MainAppBarState();

  @override
  Size get preferredSize {
    return Size.fromHeight(55.h);
  }
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Color.fromRGBO(248, 246, 246, 1),
      elevation: 0,
      centerTitle: true,
      title: Container(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    spreadRadius: 2.r,
                    blurRadius: 3.r,
                    offset: Offset(0, 3),  
                  ),
                ],
              ),
              padding: EdgeInsets.all(10.w),
              child: GestureDetector(
                onTap:(){

                } ,
                child: Icon(FeatherIcons.mapPin, color: Colors.black, size: 17.sp,),
              ),
            ),
            Expanded(
              child: Container(
                height: 40.h,
                margin: EdgeInsets.only(left: 10.w),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 3), 
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (value) {
                  },
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                    isDense: true,
                    hintText: "Search for meals or area",
                    hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                    suffixIcon: Icon(Icons.search, size: 27.sp, color: Colors.black,),
                    focusColor: Colors.blue,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(width: 1.w, color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(width: 1.w, color: Colors.white)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(width: 1.w, color: Colors.white)
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
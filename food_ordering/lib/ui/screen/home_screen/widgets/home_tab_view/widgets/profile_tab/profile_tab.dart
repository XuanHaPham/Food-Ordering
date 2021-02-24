import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering/ui/screen/sign_in_screen/sign_in_screen.dart';
import 'package:food_ordering/ui/screen/sign_in_screen/widgets/sign_in_with_google.dart';
import 'package:get/get.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({Key key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  Widget _buidProfileItem(ProfileItem profileItem, bool isLastItem) {
    return InkWell(
      onTap: () {
        switch(profileItem.type){
          case ProfileOrderEnum.help : {
            break;
          }
          case ProfileOrderEnum.favourites : {
            break;
          }
          case ProfileOrderEnum.logout : {
            signOutGoogle();
            Get.offAll(SignInSCreen());
            break;
          }
          case ProfileOrderEnum.manageAddresses : {
            break;
          }
          case ProfileOrderEnum.myOrder : {
            break;
          }
          case ProfileOrderEnum.payments : {
            break;
          }
        }
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                profileItem.icon,
                color: Colors.grey,
                size: 27.sp,
              ),
              SizedBox(
                width: 15.w,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
                child: Text(
                  profileItem.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.sp, color: Colors.grey[900]),
                ),
              ),
            ],
          ),
          isLastItem
              ? SizedBox()
              : Container(
                  margin: EdgeInsets.fromLTRB(0, 10.h, 10.w, 10.h),
                  height: 0.7.h,
                  width: double.infinity,
                  color: Colors.grey,
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.fromLTRB(20.w, 35.h, 20.w, 20.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   name,
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.w800,
                      //     fontSize: 20.sp,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 5.h,
                      // ),
                      // Text(
                      //   email,
                      //   style: TextStyle(
                      //     color: Colors.grey,
                      //     fontWeight: FontWeight.w600,
                      //     fontSize: 16.sp,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "EDIT",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.sp),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(20.w, 35.h, 20.w, 20.h),
                child: Column(
                  children: <Widget>[
                    ...LIST_ITEM.map(
                      (profileItem) => _buidProfileItem(
                          profileItem,
                          LIST_ITEM.indexOf(profileItem) ==
                              LIST_ITEM.length - 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItem {
  IconData icon;
  String title;
  ProfileOrderEnum type;
  ProfileItem({
    this.icon,
    this.title,
    this.type,
  });
}

enum ProfileOrderEnum {
  myOrder,
  manageAddresses,
  payments,
  favourites,
  help,
  logout,
}

final List<ProfileItem> LIST_ITEM = [
  ProfileItem(
      icon: Icons.list, title: "My Orders", type: ProfileOrderEnum.myOrder),
  ProfileItem(
      icon: Icons.home,
      title: "Manage Addresses",
      type: ProfileOrderEnum.manageAddresses),
  ProfileItem(
      icon: Icons.card_membership,
      title: "Payments",
      type: ProfileOrderEnum.payments),
  ProfileItem(
      icon: Icons.favorite,
      title: "Favourites",
      type: ProfileOrderEnum.favourites),
  ProfileItem(
      icon: Icons.question_answer_outlined,
      title: "Help",
      type: ProfileOrderEnum.help),
  ProfileItem(
      icon: Icons.logout, title: "Logout", type: ProfileOrderEnum.logout),
];

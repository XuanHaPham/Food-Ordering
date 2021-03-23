import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DialogUtils {
  static void showMessageDialog(
      {String title,
      @required String desciption,
      Function onOk,
      Function onCancel}) {
    AwesomeDialog(
      context: Get.context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.BOTTOMSLIDE,
      body: Container(
        padding: EdgeInsets.all(5.w),
        child: Column(
          children: [
            title.isEmpty
                ? SizedBox()
                : Container(
                    padding: EdgeInsets.only(bottom: 5.w),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
            Container(
              child: Text(desciption),
            ),
          ],
        ),
      ),
      btnCancelOnPress: onCancel,
      btnOkOnPress: onOk,
    )..show();
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering/ui/common/dialogs/yes_no_dialog.dart';
import 'package:get/get.dart';

class DialogUtils {
  static void showYesNoDialog() {
     AwesomeDialog(
            context: Get.context,
            dialogType: DialogType.NO_HEADER,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Dialog Title',
            desc: 'Dialog description here.............',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            )..show();
  }
}

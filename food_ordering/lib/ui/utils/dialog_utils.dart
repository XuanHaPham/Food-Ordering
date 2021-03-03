import 'package:flutter/material.dart';
import 'package:food_ordering/ui/common/dialogs/yes_no_dialog.dart';

class DialogUtils {
  static Future<void> showYesNoDialog() async {
    await showDialog(
      context: null,
      builder: (context) {
        YesNoDialog(
        
        );
      },
    );
  }
}

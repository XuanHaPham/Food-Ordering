import 'package:flutter/material.dart';
import 'package:food_ordering/ui/common/dialogs/base_dialog.dart';

class YesNoDialog extends StatefulWidget {
  YesNoDialog({Key key}) : super(key: key);

  @override
  _YesNoDialogState createState() => _YesNoDialogState();
}

class _YesNoDialogState extends State<YesNoDialog> {
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      background: Colors.blueAccent,
      message: "HA HA HA HA",
    );
  }
}
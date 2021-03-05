import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseDialog extends StatefulWidget {
  final Color background;
  final String title;
  final String message;
  final List<Widget> actions;
  
  BaseDialog({Key key, this.title, this.actions, this.background, this.message}) : super(key: key);

  @override
  _BaseDialogState createState() => _BaseDialogState();
}

class _BaseDialogState extends State<BaseDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: widget.background,
      child: Container(
        padding: EdgeInsets.all(5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
 
          ],
        ),
      ),
    );
  }

  Widget _buildDialogHeader(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      ],
    );
  }
}
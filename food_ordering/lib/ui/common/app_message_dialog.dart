import 'package:flutter/material.dart';

enum AppMessageDialogType {
  success,
  error,
  info,
}

class AppMessageDialog extends StatefulWidget {
  final AppMessageDialogType type;
  final String messageContent;
  AppMessageDialog({
    Key key,
    @required this.messageContent,
    @required this.type,
  }) : super(key: key);

  @override
  _AppMessageDialogState createState() => _AppMessageDialogState();
}

class _AppMessageDialogState extends State<AppMessageDialog> {
  Color _getColor() {
    switch(widget.type) {
      case AppMessageDialogType.success:
        return Colors.green;
      case AppMessageDialogType.error:
        return Colors.red;
      case AppMessageDialogType.info:
        return Colors.blue;
      default:
        return Colors.yellow;
    }
  }

  String _getTitle(){
    switch(widget.type){
      case AppMessageDialogType.success:
        return "Success";
      case AppMessageDialogType.error:
        return "Error";
      case AppMessageDialogType.info:
        return "Infor";
      default: 
        return "Unknow message";
    }
  }

  IconData _getIcon(){
    switch(widget.type){
      case AppMessageDialogType.success:
        return Icons.check;
      case AppMessageDialogType.error:
        return Icons.cancel;
      case AppMessageDialogType.info:
        return Icons.headset;
      default:
         return Icons.android;
    }
  }
  @override
  Widget build(BuildContext context) {
    return AppMessageDialog(messageContent: null, type: null);
  }
}

import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget {
  MainAppBar({Key key}) : super(key: key);

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.grey,
      elevation: 0,
      centerTitle: true,
      title: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: ,
        ),
      ),
    );
  }
}
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget{
  MainAppBar({Key key}) : super(key: key);

  @override
  _MainAppBarState createState() => _MainAppBarState();

  @override
  Size get preferredSize {
    return Size.fromHeight(55);
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
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 3),  
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                onTap:(){

                } ,
                child: Icon(FeatherIcons.mapPin, color: Colors.black, size: 17,),
              ),
            ),
            Expanded(
              child: Container(
                height: 40,
                margin: EdgeInsets.only(left: 10),
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
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    isDense: true,
                    hintText: "Search for meals or area",
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    suffixIcon: Icon(Icons.search, size: 27, color: Colors.black,),
                    focusColor: Colors.blue,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(width: 1, color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(width: 1, color: Colors.white)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(width: 1, color: Colors.white)
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
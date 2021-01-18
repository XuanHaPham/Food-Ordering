import 'package:flutter/material.dart';

class PromosTab extends StatefulWidget {
  PromosTab({Key key}) : super(key: key);

  @override
  _PromosTabState createState() => _PromosTabState();
}

class _PromosTabState extends State<PromosTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child: Text("Promos"),
       ),
    );
  }
}
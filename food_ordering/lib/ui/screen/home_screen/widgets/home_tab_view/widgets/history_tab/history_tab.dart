import 'package:flutter/cupertino.dart';

class HistoryTab extends StatefulWidget {
  HistoryTab({Key key}) : super(key: key);

  @override
  _HistoryTabState createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child: Text("History"),
       ),
    );
  }
}
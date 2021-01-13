import 'package:flutter/cupertino.dart';

class BasketTab extends StatefulWidget {
  BasketTab({Key key}) : super(key: key);

  @override
  _BasketTabState createState() => _BasketTabState();
}

class _BasketTabState extends State<BasketTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child: Text("Basket"),
       ),
    );
  }
}
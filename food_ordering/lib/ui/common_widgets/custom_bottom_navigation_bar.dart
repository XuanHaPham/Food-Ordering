import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final BottomBarItemKey highlightItemKey;
  CustomBottomNavigationBar({Key key, this.highlightItemKey}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Color.fromRGBO(245, 25, 41, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: BOTTOM_ITEM_LIST.map((item) {
          return _buildBottomBarItem(item);
        }).toList(),
      ),
    );
  }

  Widget _buildBottomBarItem(CustomBottomNavigationBarItem item) {
    bool isHighlight = widget.highlightItemKey == item.key;
    if (isHighlight) {
      return Container(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(45),
          ),
          color: Color.fromRGBO(246, 59, 73, 1),
        ),
        child: MaterialButton(
          height: double.infinity,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          onPressed: item.onPress,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  item.icon,
                  size: 35,
                  color: isHighlight ? Colors.white : Colors.black,
                ),
                SizedBox(width: 5),
                !isHighlight
                    ? SizedBox()
                    : Text(
                        item.title,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
              ],
            ),
          ),
        ),
      );
    } else {
      return MaterialButton(
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        onPressed: item.onPress,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                item.icon,
                size: 35,
                color: isHighlight ? Colors.white : Colors.black,
              ),
              SizedBox(width: 5),
              !isHighlight
                  ? SizedBox()
                  : Text(
                      item.title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
            ],
          ),
        ),
      );
    }
  }
}

class CustomBottomNavigationBarItem {
  String title;
  IconData icon;
  Function onPress;
  BottomBarItemKey key;
  CustomBottomNavigationBarItem(
      {this.icon, this.key, this.onPress, this.title});
}

enum BottomBarItemKey {
  Explore,
  OldOrder,
  Basket,
  Profile,
}

final List<CustomBottomNavigationBarItem> BOTTOM_ITEM_LIST = [
  CustomBottomNavigationBarItem(
    icon: Ionicons.ios_compass,
    key: BottomBarItemKey.Explore,
    title: "Explore",
    onPress: () {},
  ),
  CustomBottomNavigationBarItem(
    icon: MaterialCommunityIcons.history,
    key: BottomBarItemKey.OldOrder,
    title: "History",
    onPress: () {},
  ),
  CustomBottomNavigationBarItem(
    icon: Ionicons.ios_basket,
    key: BottomBarItemKey.Basket,
    title: "Basket",
    onPress: () {},
  ),
  CustomBottomNavigationBarItem(
    icon: FontAwesome.user_circle,
    key: BottomBarItemKey.Profile,
    title: "Proflie",
    onPress: () {},
  ),
];

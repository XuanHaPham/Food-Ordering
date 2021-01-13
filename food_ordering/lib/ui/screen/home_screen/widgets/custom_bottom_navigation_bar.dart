import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final MenuPositionController tabController;
  final PageController pageController;
  CustomBottomNavigationBar({Key key, this.tabController, this.pageController}) : super(key: key);

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
      child: Container(
        alignment: Alignment.center,
        child: BubbledNavigationBar(
          backgroundColor: Colors.transparent,
          defaultBubbleColor: Color.fromRGBO(246, 59, 73, 1),
          controller: widget.tabController,
          onTap: (index) {
               widget.pageController.animateToPage(
            index,
            curve: Curves.easeInOutQuad,
            duration: Duration(milliseconds: 500)
          );
          },
          items: <BubbledNavigationBarItem>[
            BubbledNavigationBarItem(
              icon: Icon(Ionicons.ios_compass, size: 35, color: Colors.amber),
              activeIcon:
                  Icon(Ionicons.ios_compass, size: 35, color: Colors.white),
              title: Text(
                'Explore',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            BubbledNavigationBarItem(
              icon: Icon(MaterialCommunityIcons.history, size: 35, color: Colors.amber),
              activeIcon:
                  Icon(MaterialCommunityIcons.history, size: 35, color: Colors.white),
              title: Text(
                'History',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            BubbledNavigationBarItem(
              icon: Icon(Ionicons.ios_basket, size: 35, color: Colors.amber),
              activeIcon:
                  Icon(Ionicons.ios_basket, size: 35, color: Colors.white),
              title: Text(
                'Basket',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            BubbledNavigationBarItem(
              icon: Icon(FontAwesome.user_circle, size: 35, color: Colors.amber),
              activeIcon: Icon(FontAwesome.user_circle,
                  size: 35, color: Colors.white),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
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
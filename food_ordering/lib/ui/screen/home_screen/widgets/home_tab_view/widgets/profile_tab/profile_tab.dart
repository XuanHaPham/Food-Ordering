import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({Key key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  Widget _buidProfileItem(ProfileItem profileItem, bool isLastItem) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              profileItem.icon,
              color: Colors.grey,
              size: 27,
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                profileItem.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey[900]),
              ),
            ),
          ],
        ),
        isLastItem
            ? SizedBox()
            : Container(
                margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                height: 0.7,
                width: double.infinity,
                color: Colors.grey,
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.fromLTRB(20, 35, 20, 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tên Của Hạ",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Mail của Hạ @gmail.com",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "EDIT",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w800,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(20, 35, 20, 20),
                child: Column(
                  children: <Widget>[
                    ...LIST_ITEM.map(
                      (profileItem) => _buidProfileItem(
                          profileItem,
                          LIST_ITEM.indexOf(profileItem) ==
                              LIST_ITEM.length - 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItem {
  IconData icon;
  String title;
  ProfileItem({
    this.icon,
    this.title,
  });
}

final List<ProfileItem> LIST_ITEM = [
  ProfileItem(icon: Icons.list, title: "My Orders"),
  ProfileItem(icon: Icons.home, title: "Manage Addresses"),
  ProfileItem(icon: Icons.card_membership, title: "Payments"),
  ProfileItem(icon: Icons.favorite, title: "Favourites"),
  ProfileItem(icon: Icons.question_answer_outlined, title: "Help"),
  ProfileItem(icon: Icons.logout, title: "Logout"),
];

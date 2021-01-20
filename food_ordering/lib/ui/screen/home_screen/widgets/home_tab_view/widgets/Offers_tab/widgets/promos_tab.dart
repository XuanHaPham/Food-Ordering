import 'package:dotted_border/dotted_border.dart';
import 'package:expandable/expandable.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromosTab extends StatefulWidget {
  PromosTab({Key key}) : super(key: key);

  @override
  _PromosTabState createState() => _PromosTabState();
}

class _PromosTabState extends State<PromosTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[...PROMO_LIST.map((promo) => PromoCard(promo))],
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  final Promo promo;
  PromoCard(this.promo);
  @override
  Widget build(BuildContext context) {
    _buildCollapsPromo() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  promo.imageUrl,
                  height: 22.h,
                ),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(3.r),
                  dashPattern: [4],
                  strokeWidth: 1.w,
                  strokeCap: StrokeCap.square,
                  color: Color.fromRGBO(245, 25, 41, 1),
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
                  child: Text(
                    promo.type,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Text(
              promo.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
              ),
            )
          ],
        ),
      );
    }

    _buildExpandedPromo() {
      return Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              promo.description,
              softWrap: true,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ScrollOnExpand(
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expandable(
                  collapsed: _buildCollapsPromo(),
                  expanded: _buildCollapsPromo(),
                ),
                Expandable(
                  collapsed: Container(),
                  expanded: _buildExpandedPromo(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Builder(
                      builder: (context) {
                        var controller = ExpandableController.of(context);
                        return FlatButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                controller.expanded ? "CLOSE" : "EXPAND",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    .copyWith(color: Colors.grey[900]),
                              ),
                              Icon(controller.expanded ? FeatherIcons.chevronUp : FeatherIcons.chevronDown),
                            ],
                          ),
                          onPressed: () {
                            controller.toggle();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Promo {
  String imageUrl;
  String type;
  String title;
  String description;
  Promo({
    this.description,
    this.imageUrl,
    this.title,
    this.type,
  });
}

const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

List<Promo> PROMO_LIST = [
  Promo(
      description: loremIpsum,
      title: "Neque porro quisquam est qui dolorem ipsum",
      type: "FREEDELPTM",
      imageUrl: "assets/images/sample_image/paytm.png"),
  Promo(
      description: loremIpsum,
      title: "Neque porro quisquam est qui dolorem ipsum",
      type: "FIRSTUSER",
      imageUrl: "assets/images/sample_image/gpay.png"),
  Promo(
      description: loremIpsum,
      title: "Neque porro quisquam est qui dolorem ipsum",
      type: "DELIVERY",
      imageUrl: "assets/images/sample_image/applepay.png"),
];

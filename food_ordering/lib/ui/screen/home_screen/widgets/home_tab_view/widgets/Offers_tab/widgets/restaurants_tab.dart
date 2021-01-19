import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class RestaurantsTab extends StatefulWidget {
  RestaurantsTab({Key key}) : super(key: key);

  @override
  _RestaurantsTabState createState() => _RestaurantsTabState();
}

class _RestaurantsTabState extends State<RestaurantsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w),
      child: ListView(
        children: [
          Container(
            height: 100.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ...BEST_DISCOUNT_LIST.map((offer) => _buildBestDiscount(offer))
              ],
            ),
          ),
          _buildTitle("Today's Offers", isShowViewAll: false),
          Container(
            height: 300.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ...TODAY_OFFER_LIST.map((offer) => _buildTodayOffer(offer))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodayOffer(Offer offer) {
    return Container(
      width: 150.w,
      margin: EdgeInsets.only(right: 15.w),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: 110.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(offer.imageUrl),
                  ),
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                margin: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(245, 25, 41, 1),
                    borderRadius: BorderRadius.circular(3.r)),
                child: Text(
                  offer.discountPersent.toStringAsFixed(0) + "% OFF",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("")],
          )
        ],
      ),
    );
  }

  Widget _buildTitle(String title, {bool isShowViewAll = true}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 25.h, 0, 10.w),
      child: Row(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
          ),
          isShowViewAll
              ? Expanded(
                  child: Text(
                    "View all",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Widget _buildBestDiscount(BestDiscount bestDiscount) {
    return Container(
      width: 250.w,
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.grey[850],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(bestDiscount.imageURL),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                bestDiscount.discountPersent.toString() + '%',
                style: TextStyle(
                    fontSize: 27.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "DISCOUNT",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  bestDiscount.description,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Valid till",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.sp.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Text(
                    DateFormat.yMMMMd().format(bestDiscount.expriceDate),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BestDiscount {
  int discountPersent;
  String description;
  DateTime expriceDate;
  String imageURL;
  BestDiscount(
      {this.description,
      this.discountPersent,
      this.expriceDate,
      this.imageURL});
}

class Offer {
  int discountPersent;
  String title;
  double star;
  String description;
  String imageUrl;
  Offer(
      {this.description,
      this.discountPersent,
      this.star,
      this.title,
      this.imageUrl});
}

List<Offer> TODAY_OFFER_LIST = [
  Offer(
    description: "Only €30.0 for two",
    discountPersent: 10,
    star: 4.0,
    title: "McDonald",
    imageUrl: "assets/images/sample_image/pizza.jpg",
  ),
  Offer(
    description: "Only €23.0 for six",
    discountPersent: 20,
    star: 3.0,
    title: "KFC",
    imageUrl: "assets/images/sample_image/pasta.jpg",
  ),
  Offer(
    description: "Only €35.0 for two",
    discountPersent: 15,
    star: 2.0,
    title: "Texact",
    imageUrl: "assets/images/sample_image/steak.jpg",
  ),
  Offer(
    description: "Only €10.0 for two",
    discountPersent: 50,
    star: 1.0,
    title: "Ruby",
    imageUrl: "assets/images/sample_image/grilled_chicken.jpg",
  ),
];

List<BestDiscount> BEST_DISCOUNT_LIST = [
  BestDiscount(
      description: "Up to €25 discount on foodie Fridays",
      discountPersent: 20,
      expriceDate: DateTime.now(),
      imageURL: "assets/images/sample_image/brg1.png"),
  BestDiscount(
      description: "Up to €30 discount on foodie Fridays",
      discountPersent: 40,
      expriceDate: DateTime.now(),
      imageURL: "assets/images/sample_image/brg2.png"),
  BestDiscount(
      description: "Up to €25 discount on foodie Fridays",
      discountPersent: 15,
      expriceDate: DateTime.now(),
      imageURL: "assets/images/sample_image/brg3.png"),
  BestDiscount(
      description: "Up to €25 discount on foodie Fridays",
      discountPersent: 10,
      expriceDate: DateTime.now(),
      imageURL: "assets/images/sample_image/brg1.png"),
];

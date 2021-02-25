import 'package:dotted_border/dotted_border.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering/ui/screens/home_screen/widgets/home_tab_view/widgets/basket_tab/widgets/basket_product_list.dart';

class BasketTab extends StatefulWidget {
  BasketTab({Key key}) : super(key: key);

  @override
  _BasketTabState createState() => _BasketTabState();
}

class _BasketTabState extends State<BasketTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Column(
        children: [
          _buildBranch(),
          Expanded(
            child: ListView(
              children: [
                BasketProductList(
                  basketItemList: LIST_BASKET_ITEM,
                ),
                _buildBillDetail(),
                _buildDeliverToWork(),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget _buildDeliverToWork() {
    return Container(
      padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(FeatherIcons.truck, size: 20.sp,),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Text(
                  "Deliver to Work",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp,),
                ),
              ),
              Text(
                "CHANGE",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "199/79, Le Quang Dinh, P.7, Q.Binh Thanh...",
            style: TextStyle(color: Colors.grey, fontSize: 14.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 30.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: Color.fromRGBO(245, 25, 41, 1),
            ),
            alignment: Alignment.center,
            child: Text(
              "MAKE PAYMENT",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillDetail() {
    return Container(
      padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 20.h),
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bill Details",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 17,
          ),
          _buildBiillDetailItem("Item Total", 26.3),
          _buildBiillDetailItem("Restaurant Charges", 3.0),
          _buildBiillDetailItem("Delivery Free", 1),
          _buildBiillDetailItem("Offer 10% OFF", 3.03, isOffer: true),
          Container(
            margin: EdgeInsets.fromLTRB(10.w, 15.h, 10.w, 15.h),
            height: 0.4.h,
            width: double.infinity,
            color: Colors.grey[400],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "To Pay",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '€27.27',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10.w, 15.h, 10.w, 15.h),
            height: 0.4.h,
            width: double.infinity,
            color: Colors.grey[400],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Any request for the restaurant?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
              Icon(
                FeatherIcons.edit,
                size: 20.sp,
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 35.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(8.r),
                    dashPattern: [4],
                    strokeWidth: 1.5.w,
                    color: Colors.grey[400],
                    child: TextField(
                      onChanged: (value) {},
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 12.h),
                        isDense: true,
                        hintText: "Enter discount code",
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.grey[400]),
                        focusColor: Colors.blue,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                                width: 1.w, color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                                width: 1.w, color: Colors.transparent)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                width: 1.w, color: Colors.transparent)),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: 110.w,
                  margin: EdgeInsets.only(left: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.grey[400],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "APPLY",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBiillDetailItem(
    String title,
    double amount, {
    bool isOffer = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
          isOffer
              ? Text(
                  '- €' + amount.toStringAsFixed(2),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                )
              : Text(
                  '€' + amount.toStringAsFixed(2),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildBranch() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/sample_image/mcd_logo.png",
            height: 40.h,
            width: 40.h,
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "McDonald's",
                style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Bodakdev",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey[500],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BasketItem {
  String productName;
  String productType;
  int qty;
  double unitPrice;
  BasketItem({this.productName, this.productType, this.qty, this.unitPrice});
}

List<BasketItem> LIST_BASKET_ITEM = [
  BasketItem(
      productName: "Chicken McWings™",
      productType: "Fried Chicken",
      qty: 2,
      unitPrice: 5),
  BasketItem(
      productName: "6 Chicken McNuggets™",
      productType: "Fried Chicken",
      qty: 2,
      unitPrice: 3),
  BasketItem(
      productName: "1pc Fried Chicken - 183 Kcal",
      productType: "Fried Chicken",
      qty: 2,
      unitPrice: 2),
  BasketItem(
      productName: "Pork Burger - 337 Kcal",
      productType: "Burger",
      qty: 2,
      unitPrice: 6),
];

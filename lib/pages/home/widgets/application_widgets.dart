import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/entities/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    title: Container(
      margin: EdgeInsets.only(
        right: 7.w,
        left: 7.w,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 15.w,
            height: 15.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/icons/person(1).png",
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

Widget homePageText(String txt,
    {Color color = AppColor.primaryText, double topVal = 10}) {
  return Container(
    margin: EdgeInsets.only(
      top: topVal.h,
    ),
    child: Text(
      txt,
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    ),
  );
}

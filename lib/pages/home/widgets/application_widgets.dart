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

Widget searchBox() {
  return Row(
    //mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColor.primaryBackground,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColor.primaryFourElementText),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 16.w,
              height: 16.h,
              margin: EdgeInsets.only(left: 17.w),
              child: Image.asset("assets/icons/search.png"),
            ),
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: TextField(
                //onChanged: (value) => funValue!(value),

                ///keyboardType: TextInputType.multiline, was used in video
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Search for course",
                  contentPadding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),

                  ///{@end default border removal}

                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "aviner",
                  fontWeight: FontWeight.normal,
                  color: AppColor.primaryText,
                ),
                autocorrect: false,

                ///to hide pass word text
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColor.primaryElement),
        ),
        child: Image.asset("assets/icons/options.png"),
      )
    ],
  );
}

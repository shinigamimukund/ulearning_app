import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/entities/values/colors.dart';
import 'package:ulearning_app/common/routes/routes.dart';

AppBar buildProfileAppBar() {
  return AppBar(
    elevation: 0.2,
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          Text(
            "Profile",
            style: TextStyle(
              color: AppColor.primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset("assets/icons/more-vertical.png"),
          ),
        ],
      ),
    ),
  );
}

Widget profileIconAndEditButton() {
  return Container(
    // margin: EdgeInsets.only(top: 20.h),
    padding: EdgeInsets.only(right: 6.w, bottom: 6.h),
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
        image: AssetImage("assets/icons/headpic.png"),
      ),
    ),
    alignment: Alignment.bottomRight,
    child: Image.asset(
      "assets/icons/edit_3.png",
      width: 25.w,
      height: 25.h,
    ),
  );
}

///ListView with Map,List.generate,elementAt()
var imageInfo = <String, String>{
  "Setting": "settings.png",
  "Payment details": "credit-card.png",
  "Achievement": "award.png",
  "Love": "heart(1).png",
  "Reminder": "cube.png",
};
Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ///... is used to combine list
      ///List.generate is used as for loop
      ...List.generate(
        imageInfo.length,
        (index) => GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.SETTING_PAGE),
          child: Container(
            padding: EdgeInsets.only(
              top: 20.h,
            ),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: EdgeInsets.all(7.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: AppColor.primaryElement),
                  child: Image.asset(
                      "assets/icons/${imageInfo.values.elementAt(index)}"),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  imageInfo.keys.elementAt(index),
                  style: TextStyle(
                    color: AppColor.primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

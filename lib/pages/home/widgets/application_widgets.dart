import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/home/bloc/bloc/home_page_bloc.dart';

import '../../../common/entities/values/colors.dart';
import '../../../common/widgets/base_text_widgets.dart';

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
    // mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
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
        margin: EdgeInsets.only(left: 8.w, top: 20.h),
        decoration: BoxDecoration(
          color: AppColor.primaryElement,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColor.primaryElement),
        ),
        child: Image.asset("assets/icons/options.png"),
      )
    ],
  );
}

Widget slidersView(BuildContext context, HomePageState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              onPageChanged: (value) {
                print("on page change ${value.toString()}");
                context.read<HomePageBloc>().add(HomePageDots(index: value));
              },
              children: [
                _pageViewSlider(imageAsset: "assets/icons/art.png"),
                _pageViewSlider(imageAsset: "assets/icons/Image_1.png"),
                _pageViewSlider(imageAsset: "assets/icons/art.png"),
              ],
            ),
          ],
        ),
      ),
      dotIndicator(context, state),
    ],
  );
}

Widget _pageViewSlider({String imageAsset = "assets/icons/art.png"}) {
  return SizedBox(
    height: 200.h,
    width: 325.w,
    child: Container(
      width: 325.w,
      height: 160.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            imageAsset,
          ),
        ),
      ),
    ),
  );
}

Widget dotIndicator(BuildContext context, HomePageState state) {
  return Container(
    alignment: Alignment.center,
    child: DotsIndicator(
      ///this value state.page is updated from index of PageView
      position: state.index,
      dotsCount: 3,
      decorator: DotsDecorator(
        color: AppColor.primaryThreeElementText,
        activeColor: AppColor.primaryElement,
        size: const Size.square(8.0),
        activeSize: const Size(18.0, 8.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    ),
  );
}

Widget mainView() {
  return Container(
    width: 325.w,
    margin: EdgeInsets.only(top: 15.h),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            reusableText(
              "Choose your course",
            ),
            GestureDetector(
              child: reusableText(
                "See all",
                color: AppColor.primaryThreeElementText,
                fontSize: 10,
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _reusableMenuText("All"),
              _reusableMenuText(
                "Popular",
                bgColor: AppColor.primaryBackground,
                textColor: AppColor.primaryThreeElementText,
              ),
              _reusableMenuText(
                "Newest",
                bgColor: AppColor.primaryBackground,
                textColor: AppColor.primaryThreeElementText,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _reusableMenuText(String text,
    {Color bgColor = AppColor.primaryElement,
    Color textColor = AppColor.primaryElementText}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(7.w),
      border: Border.all(color: bgColor),
    ),
    child: reusableText(text,
        color: textColor, fontWeight: FontWeight.normal, fontSize: 11),
  );
}

Widget courseGrid() {
  return Container(
    // width: 100.w,
    // height: 100.h,
    padding: EdgeInsets.all(12.w),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("assets/icons/Image_1.png"),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best Course for IT and Engineering",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            color: AppColor.primaryElementText,
            fontWeight: FontWeight.bold,
            fontSize: 11.sp,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "Flutter best course",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            color: AppColor.primaryFourElementText,
            fontWeight: FontWeight.normal,
            fontSize: 8.sp,
          ),
        ),
      ],
    ),
  );
}

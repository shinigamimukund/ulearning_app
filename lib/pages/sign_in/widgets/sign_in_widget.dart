import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///this page is used to `seperate` widgets of `sign_in.dart`
/// this is how we Seperate widgets into different files
AppBar buildAppBar() {
  return AppBar(
    ///this is how you add `custom` Shadow/Shadow Color and Elevation to [AppBar]
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(0.3),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
      ),
    ),
    title: Text(
      "Sign In",
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
    centerTitle: true,
  );
}

///{@Start BuildContext}
/// [BuildContext contex] is used in this method because
/// `context` will be used for [Bloc]
/// {@End BuildContext}
Widget buildThirdPartyLogIn(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: 40.h,
      bottom: 20.h,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _reusableLoginIcons("google"),
        _reusableLoginIcons("apple"),
        _reusableLoginIcons("facebook"),
      ],
    ),
  );
}

///make function private, [_reusableLoginIcons], only if that
///function is used in this file only
Widget _reusableLoginIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 40.h,
      height: 40.h,
      child: Image.asset(
        ///iconName is recived from parameter
        "assets/icons/$iconName.png",
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget reusableLableText(String lable) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 5.h,
    ),
    child: Text(
      lable,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.7),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget buidTextField(String text, String textType) {
  return Container(
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: const BorderRadius.all(
        Radius.circular(
          15,
        ),
      ),

      ///border color
      border: Border.all(color: Colors.black),
    ),
    child: Row(
      children: [
        Container(
          height: 15.h,
          width: 15.w,
          margin: EdgeInsets.only(left: 16.w),
          child: Image.asset("assets/icons/user.png"),
        ),
        Container(
          width: 270.w,
          height: 50.h,
          child: const TextField(
            ///keyboardType: TextInputType.multiine, was used in video
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Enter email address",

              ///{@start default border removal}
              ///all the below `border` is made `transparent` to `remove` the
              ///`unnessessory default border`
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),

              ///{@end default border removal}
            ),
          ),
        ),
      ],
    ),
  );
}

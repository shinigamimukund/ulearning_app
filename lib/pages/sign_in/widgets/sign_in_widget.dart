import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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

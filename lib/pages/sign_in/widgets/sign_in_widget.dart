import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/entities/values/colors.dart';

///this page is used to `separate` widgets of `sign_in.dart`
/// this is how we Separate widgets into different files
AppBar buildAppBar() {
  return AppBar(
    ///play with elevation and bottom to customize [AppBar] `shadow`
    elevation: 0.2,

    ///this is how you add `custom` Shadow/Shadow Color and Elevation to [AppBar]
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(0.5),
      child: Container(
        color: AppColor.primarySecondaryBackground,
      ),
    ),
    title: Text(
      "Sign In",
      style: TextStyle(
        color: AppColor.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
    centerTitle: true,
  );
}

///{@Start BuildContext}
/// [BuildContext context] is used in this method because
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
    child: SizedBox(
      width: 40.h,
      height: 40.h,
      child: Image.asset(
        ///iconName is received from parameter
        "assets/icons/$iconName.png",
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget reusableLabelText(String label) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 5.h,
      top: 5.h,
    ),
    child: Text(
      label,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.7),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget buildTextField(
  String textType,
  String hintText,
  String iconName,
  void Function(dynamic value)? funValue,
) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(
          15,
        ),
      ),

      ///border color
      border: Border.all(color: AppColor.primaryText),
    ),
    child: Row(
      children: [
        Container(
          height: 16.h,
          width: 16.w,
          margin: EdgeInsets.only(left: 16.w),
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        Container(
          width: 270.w,
          height: 50.h,
          margin: EdgeInsets.only(top: 2.h), //custom mukund code
          child: TextField(
            /**   usually this is how we pass value for onChanged or onTap
             * [context.read<SigninBloc>().add(PasswordEvent(value));]
             *    since we are making our code DYNAMIC, we are passing it as function 
             *    as shown below
             */
            onChanged: (value) => funValue!(value),

            ///keyboardType: TextInputType.multiline, was used in video
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: hintText,

              ///{@start default border removal}
              ///all the below `border` is made `transparent` to `remove` the
              ///`unnecessary default border`
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
            obscureText: textType == "password" ? true : false,
          ),
        ),
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
    width: 260.w,
    height: 44.h,
    margin: EdgeInsets.only(bottom: 40.h),
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot Password!",
        style: TextStyle(
          color: Colors.black,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
          fontSize: 14.sp,
        ),
      ),
    ),
  );
}

Widget buttonForLoginAndReg(String buttonType, String buttonName, void Function()? buttonFunction) {
  return GestureDetector(
    onTap: ()=> buttonFunction,
    child: Container(
      width: 325.w,
      height: 40.h,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
        ///condition check for button color
        color: buttonType == "login"
            ? AppColor.primaryElement
            : AppColor.primaryBackground,

        ///can also use [BorderRadius.circular(15),]
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(1, 1),
            color: Colors.grey.withOpacity(0.8),
          ),
        ],
      ),
      child: Text(
        buttonName,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,

          ///condition check for button text color
          color: buttonType == "login"
              ? AppColor.primaryBackground
              : AppColor.primaryText,
        ),
      ),
    ),
  );
}

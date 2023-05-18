import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/entities/values/colors.dart';
import 'package:ulearning_app/pages/application/widgets/application_widget.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(_index),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: BoxDecoration(
              color: AppColor.primaryElement,

              ///to hide the top left and top right border in bottomNavigationBar
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.h),
                topRight: Radius.circular(20.h),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: _index,
              onTap: (value) {
                setState(() {
                  _index = value;
                  print(_index);
                });
              },

              ///selected items don't go up
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColor.primaryElement,
              unselectedItemColor: AppColor.primaryFourElementText,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/home.png"),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      "assets/icons/home.png",
                      color: AppColor.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Search",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/search.png"),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      "assets/icons/search2.png",
                      color: AppColor.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Course",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/play-circle1.png"),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      "assets/icons/play-circle1.png",
                      color: AppColor.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Chat",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/message-circle.png"),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      "assets/icons/message-circle.png",
                      color: AppColor.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/person.png"),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      "assets/icons/person.png",
                      color: AppColor.primaryElement,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

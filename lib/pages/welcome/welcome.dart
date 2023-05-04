import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView(
                    onPageChanged: (index) {
                      state.page = index;

                      ///when the index is updated state.page in WelcomeState is updated
                      ///because of this below line ie [BlocProvide]
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                      print("index of PageView is ${state.page}");
                    },
                    children: [
                      _page(
                        index: 1,
                        contextRes: context,
                        buttonName: "Next",
                        title: "First See Learning",
                        subTitle:
                            "Forget about a for of paper all knowledge on one earning!",
                        imagePath: "assets/images/reading.png",
                      ),
                      _page(
                        index: 2,
                        contextRes: context,
                        buttonName: "Next",
                        title: "Connect With Everyone",
                        subTitle:
                            "Always keep in touch with your tutor & friens.Let's get connected!",
                        imagePath: "assets/images/boy.png",
                      ),
                      _page(
                        index: 3,
                        contextRes: context,
                        buttonName: "Get Started",
                        title: "Alwas Fasinated Learning",
                        subTitle:
                            "Anywhere,anytime.Time is at your discretion so study whenever you want",
                        imagePath: "assets/images/man.png",
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 100.h,

                    ///`DotsIndicator` is package
                    child: DotsIndicator(
                      ///this value state.page is updated from index of PageView
                      position: state.page.toDouble(),
                      dotsCount: 3,
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.blue,
                        size: const Size.square(8.0),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(
      {required int index,
      required BuildContext contextRes,
      required String buttonName,
      required String title,
      required String subTitle,
      required String imagePath}) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          width: 375.w,
          child: Text(
            subTitle,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),

        ///Blue button in welcome page
        Container(
          width: 375.w,
          height: 50.h,
          margin: EdgeInsets.only(top: 100.h, left: 30.w, right: 30.w),

          ///Style the Container with boxDecoration
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(15.w),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

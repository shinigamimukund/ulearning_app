import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/entities/values/colors.dart';
import 'package:ulearning_app/pages/application/bloc/application_bloc.dart';
import 'package:ulearning_app/pages/application/widgets/application_widget.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  // final int _index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
        builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: buildPage(state.index),
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
                currentIndex: state.index,
                onTap: (value) {
                  ///on tap, value is passed to state
                  context.read<ApplicationBloc>().add(TriggerAppEvent(value));
                  // setState(() {
                  //   _index = value;
                  //   // print(_index);
                  // });
                },

                ///selected items don't go up
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: AppColor.primaryElement,
                unselectedItemColor: AppColor.primaryFourElementText,
                elevation: 0,
                items: bottomTab,
              ),
            ),
          ),
        ),
      );
    });
  }
}

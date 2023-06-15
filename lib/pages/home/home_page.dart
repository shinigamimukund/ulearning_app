import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/entities/values/colors.dart';
import 'package:ulearning_app/pages/home/bloc/bloc/home_page_bloc.dart';
import 'package:ulearning_app/pages/home/widgets/application_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 23.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              homePageText("Home", color: AppColor.primaryThreeElementText),
              homePageText("Ulearn", topVal: 5),
              searchBox(),
              slidersView(context,state),
              mainView(),
            ],
          ),
        );
      }),
    );
  }
}

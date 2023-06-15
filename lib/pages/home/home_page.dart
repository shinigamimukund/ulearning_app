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
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: homePageText("Home",
                    color: AppColor.primaryThreeElementText),
              ),
              SliverToBoxAdapter(
                child: homePageText("Ulearn", topVal: 5),
              ),
              SliverToBoxAdapter(
                child: searchBox(),
              ),
              SliverToBoxAdapter(
                child: slidersView(context, state),
              ),
              SliverToBoxAdapter(
                child: mainView(),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 18.h,
                  horizontal: 0.w,
                ),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.6,
                  ),
                  delegate: SliverChildBuilderDelegate(childCount: 4,
                      (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
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
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/pages/application/application_page.dart';
import 'package:ulearning_app/pages/register/register.dart';
import 'package:ulearning_app/pages/register/widgets/bloc/register_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/bloc/signin_bloc.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (context) => SigninBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const Application(),
        // bloc: BlocProvider(
        //   create: (context) => RegisterBloc(),
        // ),
      ),
    ];
  }

  static List<PageEntity> routesList = routes();

  static List<dynamic> allBlocProvidersFun(BuildContext context) {
    List<dynamic> blocProviders = [];

    ///AppPages.routesList is used because list is static and
    ///---must be accessed using class name
    for (var blocs in AppPages.routesList) {
      if (blocs.bloc != null) blocProviders.add(blocs.bloc);
    }
    //this is how to print elements in routesList
    // List<PageEntity> routesList = routes();
    // routesList.forEach((PageEntity) {
    //   print('Route: ${PageEntity.route}');
    //   print('Page: ${PageEntity.page}');
    //   print('bloc: ${PageEntity.bloc}');
    // });
    print("list is = $blocProviders");
    return blocProviders;
  }
}

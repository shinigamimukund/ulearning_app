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
  ///routes function of return type list
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

  ///function return type is of list<dynamic>
  ///its not a separate nameless List
  /// this is allBlockProvidersFun function of return type list
  static List<dynamic> allBlocProvidersFun(BuildContext context) {
    List<dynamic> blocProviders = [];

    for (var blocs in AppPages.routes()) {
      if (blocs.bloc != null) blocProviders.add(blocs.bloc);
    }

    print("list is = $blocProviders");
    return blocProviders;
  }
}

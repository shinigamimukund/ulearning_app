import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/entities/values/colors.dart';
import 'package:ulearning_app/common/routes/pages.dart';
import 'package:ulearning_app/pages/application/application_page.dart';
import 'package:ulearning_app/pages/bloc_providers.dart';
import 'package:ulearning_app/pages/register/register.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
// import 'package:ulearning_app/pages/welcome/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //firebase implementation
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ///Dependency injection
    ///should be do'nt at the top level of the tree
    return MultiBlocProvider(
      /// ... adds the allBlockProvider to the existing list
      providers: [...AppPages.allBlocProvidersFun(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,

          ///this is how you setup `theme` for entire app
          ///it should we done in [MaterialApp]
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0.7,

              ///back Arrow color black because of this iconTheme
              iconTheme: IconThemeData(
                color: AppColor.primaryText,
              ),
              backgroundColor: Colors.white,
            ),
          ),
          initialRoute: "/",
          home: const Application(),
          routes: {
            "signIn": (context) => const SignIn(),
            "register": (context) => const Register(),
          },
        ),
      ),
    );
  }
}

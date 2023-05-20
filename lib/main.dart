import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/entities/values/colors.dart';
import 'package:ulearning_app/common/routes/routes.dart';

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
          onGenerateRoute: AppPages.generateRouteSettings,
        ),
      ),
    );
  }
}

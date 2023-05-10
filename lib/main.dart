import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/app_blocks.dart';
import 'package:ulearning_app/app_states.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

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
    ///Dependancy injection
    ///should be dont at the top level of the tree
    return MultiBlocProvider(
      //this is how we create Multi block Provider
      /**now we will use `lazy` to load the provider because
       * always the `first` block is loaded `first` when the app starts so to
       * avoid this we use `lazy` to load the `important` bloc
       * [********Important**********]
       * If `lazy` is `falsy` then that bloc loads first
       * If `lazy` is `true`, that bloc loads `after` the bloc which are marked `lazy` as `false`
      */
      ///`lazy` is used tell which bloc is exicuted first
      ///by default lazy is true
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => AppBlocs(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,

          ///this is how you setup `theme` for entire app
          ///it should we done in [MaterialApp]
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0.7,
              backgroundColor: Colors.white,
            ),
          ),
          home: const Welcome(),
          routes: {
            "myHomePage": (context) => const MyHomePage(),
            "signIn": (context) => const SignIn(),
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<AppBlocs, AppState>(
          builder: (context, state) {
            return const Center(
              child: Text(
                "Hello",
              ),
            );
          },
        ),
      ),
    );
  }
}

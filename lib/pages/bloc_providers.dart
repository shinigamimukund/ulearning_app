import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/register/widgets/bloc/register_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/bloc/signin_bloc.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';

/**now we will use `lazy` to load the provider because
       * always the `first` block is loaded `first` when the app starts so to
       * avoid this we use `lazy` to load the `important` bloc
       * [********Important**********]
       * If `lazy` is `falsy` then that bloc loads first
       * If `lazy` is `true`, that bloc loads `after` the bloc which are marked `lazy` as `false`
      */
///`lazy` is used tell which bloc is executed first
///by default lazy is true
class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SigninBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ];
}

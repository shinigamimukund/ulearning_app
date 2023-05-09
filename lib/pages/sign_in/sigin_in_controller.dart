import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/bloc/signin_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn(String type) {
    try {
      if (type == "email") {
        ///to `read` the `state` value from [SigninBloc]
        ///we can also `retrieve state value` like this----below code
        ///[BlocProvider.of<SigninBloc>(context).state;]
        final state = context.read<SigninBloc>().state;

        String? emailAddress = state.email;
        String? password = state.password;

        if (emailAddress!.isEmpty) {
          //using package to handle verification
        }
        if (password!.isEmpty) {
          //using package to handle verification
        }
      }
    } catch (e) {
      //add catch block
    }
  }
}

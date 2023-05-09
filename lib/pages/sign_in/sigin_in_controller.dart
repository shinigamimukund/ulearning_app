import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/bloc/signin_bloc.dart';

/// this where we compare user input and firebase data
/// this is where we authenticate login(or other data)
class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
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
        try {
          final credentials = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
        } catch (e) {
          //
        }
      }
    } catch (e) {
      //add catch block
    }
  }
}

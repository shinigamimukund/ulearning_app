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
        final userEnteredCredentials = context.read<SigninBloc>().state;

        String? emailAddress = userEnteredCredentials.email;
        String? password = userEnteredCredentials.password;

        if (emailAddress!.isEmpty) {
          //using package to handle verification
        }
        if (password!.isEmpty) {
          //using package to handle verification
        }
        try {
          final firebaseCredentials = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          if (firebaseCredentials.user == null) {
            //
          }

          ///`user!`.......(null assertion operator)
          //////meaning it will dart that user? which is nullable type
          //////that `user!` is not null
          ///`!credentials`..... (boolean operator `NOT`)
          if (!firebaseCredentials.user!.emailVerified) {
            //
          }
        } catch (e) {
          //
        }
      }
    } catch (e) {
      //add catch block
    }
  }
}

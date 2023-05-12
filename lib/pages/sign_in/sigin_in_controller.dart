import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ulearning_app/pages/sign_in/bloc/bloc/signin_bloc.dart';
import 'package:ulearning_app/widgets/flutter_toast.dart';

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
          toastInfo(message: "user field empty");
        }
        if (password!.isEmpty) {
          //using package to handle verification
          toastInfo(message: "password field empty");
        }
        try {
          /// 1) to use firebaseAuth for all types like email,google,facebook etc
          ///     [FirebaseAuth.instance] is default after that
          ///     different method is used for different purpose
          ///     here we use [.signInWithEmailAndPassword()] for `email` and `password`
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

          var user = firebaseCredentials.user;
          if (user != null) {
            toastInfo(message: "user exists");
          } else {
            toastInfo(message: "user does'nt exists");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(message: "No user found for that email");
          } else if (e.code == 'wrong-password') {
            toastInfo(message: "wrong password provided for the user");
          } else if (e.code == 'invalid-email') {
            toastInfo(message: "your email format is incorrect");
          }
        }
      }
    } catch (e) {
      //add catch block
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/register/widgets/bloc/register_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegistration() async {
    final state = context.read<RegisterBloc>().state;
    final String userName = state.userName;
    final String email = state.email;
    final String password = state.password;
    final String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(message: "User name cannot be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(message: "Email cannot be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(message: "Password cannot be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(message: "Password confirmation failed");
      return;
    }

    try {
      final firebaseCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (firebaseCredential.user != null) {
        await firebaseCredential.user?.sendEmailVerification();
        await firebaseCredential.user?.updateDisplayName(userName);
        toastInfo(
          message:
              "Check your email inbox and clink on the link to complete the registration",
        );
        ///[pop()]navigates back to the top most Route.
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(message: "Password strength is low");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(message: "Email already in use");
      } else if (e.code == 'invalid-email') {
        toastInfo(message: "Enter valid email");
      }
    }
  }
}

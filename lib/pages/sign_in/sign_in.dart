import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/sign_in/sigin_in_controller.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widget.dart';

import 'bloc/bloc/signin_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Sign In"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogIn(context),
                    Center(
                      child: reusableLabelText(
                          "Or use your email account to login"),
                    ),

                    ///we are using [Container] here to apply `margin` after
                    ///the above text
                    ///and we are using [Column] because to group/Separate the Input related
                    ///widgets or to group similar widgets because of `UI` or `use`.
                    Container(
                      margin: EdgeInsets.only(top: 40.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableLabelText("Email"),
                          buildTextField(
                            "email",
                            "Enter your email address",
                            "user",
                            (value) {
                              context.read<SigninBloc>().add(EmailEvent(value));
                            },
                          ),
                          reusableLabelText("Password"),
                          buildTextField(
                            "password",
                            "Enter your password",
                            "lock",
                            (value) {
                              context
                                  .read<SigninBloc>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                          forgotPassword(),

                          buttonForLoginAndReg(
                            "login",
                            "Log In",
                            () {
                              SignInController(context: context)
                                  .handleSignIn("email");
                            },
                          ),
                          buttonForLoginAndReg(
                            "register",
                            "Register ",
                            () {
                              Navigator.of(context).pushNamed("/register");
                            },
                          ),

                          // SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

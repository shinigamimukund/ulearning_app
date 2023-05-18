import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/register/register_controller.dart';
import 'package:ulearning_app/pages/register/widgets/bloc/register_bloc.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Sign Up"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: reusableLabelText(
                          "Enter your details below& free sign up"),
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
                          reusableLabelText("User name"),
                          buildTextField(
                            "user",
                            "Enter your user name",
                            "user",
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(UserNameEvent(value));
                            },
                          ),
                          reusableLabelText("Email"),
                          buildTextField(
                            "email",
                            "Enter your email address",
                            "user",
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(EmailEvent(value));
                            },
                          ),
                          reusableLabelText("Password"),
                          buildTextField(
                            "password",
                            "Enter your password",
                            "lock",
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                          reusableLabelText("Confirm Password"),
                          buildTextField(
                            "confirm_password",
                            "Re-Enter your password",
                            "lock",
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(RePasswordEvent(value));
                            },
                          ),
                          reusableLabelText(
                              "By creating an account you have to agree with our terms & condition"),
                          SizedBox(
                            height: 15.h,
                          ),
                          buttonForLoginAndReg(
                            "login",
                            "Sign Up ",
                            () {
                              // Navigator.of(context).pushNamed("register");
                              // print("Registration button");
                              RegisterController(context: context)
                                  .handleEmailRegistration();
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

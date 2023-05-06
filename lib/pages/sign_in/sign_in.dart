import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            ///this is how you add `custom` Shadow/Shadow Color and Elevation to [AppBar]
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.3),
              child: Container(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            title: Text(
              "Sign In",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
    );
  }
}

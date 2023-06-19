import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/base_text_widgets.dart';
import 'package:ulearning_app/pages/application/bloc/application_bloc.dart';

import '../../../../common/entities/values/colors.dart';
import '../../../../common/entities/values/constants.dart';
import '../../../../common/routes/names.dart';
import '../../../../global.dart';

AppBar buildSettingsAppBar() {
  return AppBar(
    elevation: 0.2,
    title: Container(
      alignment: Alignment.center,
      child: reusableText("Setting"),
    ),
  );
}

Widget settingsButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm logout"),
              content: const Text("Confirm logout"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    context
                        .read<ApplicationBloc>()
                        .add(const TriggerAppEvent(0));
                    Global.storageService
                        .remove(AppConstants.STORAGE_USER_TOKEN_KEY);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.SIGN_IN, (route) => false);
                  },
                  child: const Text("Confirm"),
                ),
              ],
            );
          });
    },
    child: Container(
      alignment: Alignment.center,
      width: 200.w,
      height: 100.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage("assets/icons/Logout.png"),
        ),
      ),
    ),
  );
}

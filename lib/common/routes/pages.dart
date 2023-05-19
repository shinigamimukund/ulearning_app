import 'package:flutter/material.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}

class AppPages {
  List<PageEntity> routes = [
    PageEntity(
      route: AppRoutes.INITIAL,
      page: const Welcome(),
      
    )
  ];
}

import 'package:flutter/material.dart';

///dynamic pages
Widget buildPage(int index) {
  List<Widget> widget = [
    const Center(
      child: Text("home"),
    ),
    const Center(
      child: Text("home"),
    ),
    const Center(
      child: Text("home"),
    ),
    const Center(
      child: Text("home"),
    ),
  ];
  return widget[index];
}

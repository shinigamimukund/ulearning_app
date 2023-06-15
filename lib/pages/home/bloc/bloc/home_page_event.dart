part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {
  const HomePageEvent();
}

class HomePageDots extends HomePageEvent {
  final int? index;
  const HomePageDots({this.index});
}

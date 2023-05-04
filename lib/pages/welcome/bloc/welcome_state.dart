part of 'welcome_bloc.dart';

abstract class WelcomeState {
  int page;

  WelcomeState({required this.page});
}

class WelcomeInitial extends WelcomeState {
  WelcomeInitial() : super(page: 0);
}

class WelcomePageChange extends WelcomeState {
  WelcomePageChange({required int page}) : super(page: 0);
}

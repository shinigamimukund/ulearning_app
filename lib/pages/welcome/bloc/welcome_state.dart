part of 'welcome_bloc.dart';

@immutable
abstract class WelcomeState {
  final int page;
  const WelcomeState({required this.page});
}

class WelcomeInitial extends WelcomeState {
  const WelcomeInitial() : super(page: 0);
}

class WelcomePageChange extends WelcomeState {
  const WelcomePageChange({required int page}) : super(page: 0);
}

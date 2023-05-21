part of 'application_bloc.dart';

@immutable
abstract class ApplicationState {
  final int index;
  const ApplicationState({required this.index});
}

class ApplicationInitial extends ApplicationState {
  const ApplicationInitial() : super(index: 0);
}

class ChangeApplicationIndex extends ApplicationState {
  const ChangeApplicationIndex({required super.index});
}

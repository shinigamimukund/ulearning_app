part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class EmailEvent extends SigninEvent {
  final String email;
  EmailEvent(this.email);
}

class PasswordEvent extends SigninEvent {
  final String password;
  PasswordEvent(this.password);
}

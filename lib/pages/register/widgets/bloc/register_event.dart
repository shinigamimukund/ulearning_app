part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterUserNameEvent extends RegisterEvent {
  final String username;
  RegisterUserNameEvent(this.username);
}

class RegisterEmailEvent extends RegisterEvent {
  final String email;
  RegisterEmailEvent(this.email);
}

class RegisterPasswordEvent extends RegisterEvent {
  final String password;
  RegisterPasswordEvent(this.password);
}

part of 'signin_bloc.dart';


///single class [SigninEven] is inherited to all the classes 
///because when we use the [SigninEvent] class in [SigninBloc]
///all the sub classes(all the events) will be `passed` to [SigninBloc]
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

part of 'signin_bloc.dart';

///State bloc contains all the `Variable` which holds the state
@immutable
abstract class SigninState {
  final String? email;
  final String? password;
  const SigninState({this.email, this.password });
}

class SigninInitial extends SigninState {
  const SigninInitial():super(email : "", password : "");
}

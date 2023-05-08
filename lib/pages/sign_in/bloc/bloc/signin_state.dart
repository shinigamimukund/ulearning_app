part of 'signin_bloc.dart';

///State bloc contains all the `Variable` which holds the state
@immutable
class SigninState {
  final String? email;
  final String? password;
  const SigninState({this.email, this.password});

  SigninState copyWith({String? email, String? password}) {
    return SigninState(
      ///{@start ??}
      ///if copy email is empty this.email is assigned that is -
      ///  if no value is passed then "" empty value is assigned
      ///print(1 ?? 3); // <-- Prints 1.
      ///print(null ?? 12); // <-- Prints 12.
      //////{@end ??}
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

class SigninInitial extends SigninState {
  const SigninInitial() : super(email: "", password: "");
}

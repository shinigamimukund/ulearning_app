part of 'register_bloc.dart';

@immutable
class RegisterState {
  final String email;
  final String userName;
  final String password;
  final String rePassword;
  const RegisterState({
    this.userName = "",
    this.email = "",
    this.password = "",
    this.rePassword = "",
  });

  RegisterState copyWith({
    ///`{}` is used to make parameters `named and optional`
    String? userName,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterState(
      ///IF `userName` is null then `this.userName` value is considered
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
    );
  }
}

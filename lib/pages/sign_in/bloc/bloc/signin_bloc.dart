import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  ///super should be the class with Initial state
  SigninBloc() : super(const SigninInitial()) {
    on<SigninEvent>((event, emit) {
      on<EmailEvent>(_emailEvent);
      on<PasswordEvent>(_passwordEvent);
    });
  }

  void _emailEvent(EmailEvent event, Emitter<SigninState> emit) {
    print("my email id is ${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(
      PasswordEvent event, Emitter<SigninState> emitCustomName) {
    print("my password is ${event.password}");
    emitCustomName(state.copyWith(password: event.password));
  }
}

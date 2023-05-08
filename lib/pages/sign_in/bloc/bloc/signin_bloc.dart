import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  ///super should be the class with Initial state
  SigninBloc() : super(const SigninInitial()) {
    on<SigninEvent>((event, emit) {
      on<EmailEvent>((event, emit) {
        // TODO: implement event handler
      });
      on<PasswordEvent>((event, emit) {
        // TODO: implement event handler
      });
    });
  }
}

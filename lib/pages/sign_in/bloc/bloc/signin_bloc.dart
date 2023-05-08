import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  ///super should be the class with Initial state
  SigninBloc() : super(const SigninInitial()) {
    on<SigninEvent>((event, emit) {
      ///{@start event methods}
      ///this is where we write [event handling code]
      ///there are [2] methods here -
      ///`on()` and `(event,emit){}` methods
      ///`on()` method takes `(event,emit){}` as [parameter]
      ///{@start event methods}
      on<EmailEvent>((event, emit) {
        ///-------we can write it like below also but,
        ///-------we need to pass only email so
        ///[emit(state.copyWith(email: state.email, password: state.password));]
        emit(state.copyWith(email: state.email));
      });
      on<PasswordEvent>((event, emit) {
        emit(state.copyWith(password: state.password));
      });
    });
  }
}

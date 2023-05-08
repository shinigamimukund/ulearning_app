import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  ///super should be the class with Initial state
  SigninBloc() : super(const SigninInitial()) {
    on<SigninEvent>((event, emit) {
      ///-------emit state, for email and password event------old way
      // on<EmailEvent>((event, emit) {
      //   emit(state.copyWith(email: state.email));
      // });
      // on<PasswordEvent>((event, emit) {
      //   emit(state.copyWith(password: state.password));
      // });

      ///separating [(event,emit)] from [on()]
      ///below code replaces the above code---------new way
      on<EmailEvent>(_emailEvent);
      on<PasswordEvent>(_passwordEvent);
    });
  }

  ///emit for email event
  void _emailEvent(SigninEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(email: state.email));
  }

  ///emit for password event
  void _passwordEvent(SigninEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(password: state.password));
  }
}

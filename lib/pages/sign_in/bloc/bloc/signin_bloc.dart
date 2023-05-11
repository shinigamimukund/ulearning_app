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

  
  void _emailEvent(SigninEvent event, Emitter<SigninState> emit) {
    
    emit(state.copyWith(email: state.email));
  }

  
  void _passwordEvent(PasswordEvent event, Emitter<SigninState> emitCustomName) {
    
    emitCustomName(state.copyWith(password: state.password));
  }
}

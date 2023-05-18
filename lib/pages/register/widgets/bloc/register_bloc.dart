import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    ///`separating` on method by replacing[(event,emit){}] method with
    ///[_userNameEvent] method
    ///default on method
    /// [on<UserNameEvent>((event, emit){});]

    ///userName Bloc
    on<UserNameEvent>(_userNameEvent);

    ///userName Bloc
    on<EmailEvent>(_emailEvent);

    ///userName Bloc
    on<PasswordEvent>(_passwordEvent);

    ///userName Bloc
    on<RePasswordEvent>(_rePasswordEvent);
  }

  ///userName Bloc
  void _userNameEvent(UserNameEvent event, Emitter<RegisterState> emit) {
    // print("user name = ${event.userName}");
    emit(state.copyWith(userName: event.userName));
  }

  ///userName Bloc
  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    // print("email  = ${event.email}");
    emit(state.copyWith(email: event.email));
  }

  ///userName Bloc
  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    // print("password = ${event.password}");
    emit(state.copyWith(password: event.password));
  }

  ///userName Bloc
  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterState> emit) {
    // print("Re password = ${event.rePassword}");
    emit(state.copyWith(rePassword: event.rePassword));
  }
}

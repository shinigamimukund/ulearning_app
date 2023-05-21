import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationInitial()) {
    ///on trigger event index value is changed
    on<TriggerAppEvent>(_triggerIndexEvent);
  }
  _triggerIndexEvent(TriggerAppEvent event, Emitter emit) {
    emit(ChangeApplicationIndex(index: event.index));
  }
}

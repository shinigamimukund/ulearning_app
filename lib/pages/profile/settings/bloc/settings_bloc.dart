import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<TriggerSettings>(_triggerSettings);
  }

  _triggerSettings(SettingsEvent event, Emitter<SettingsState> emit) {
    emit(const SettingsState());
  }
}

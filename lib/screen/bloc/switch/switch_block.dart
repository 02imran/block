import 'package:block_test/screen/bloc/switch/switch_events.dart';
import 'package:block_test/screen/bloc/switch/switch_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBlock extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBlock() : super(const SwitchStates()) {
    on<NotificationEnableDisableEvents>(_enableOrDisableNotification);
    on<SliderEvent>(_sliderEvent);
  }

  void _enableOrDisableNotification(
      NotificationEnableDisableEvents events, Emitter<SwitchStates> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

    void _sliderEvent(SliderEvent events, Emitter<SwitchStates> emit) {
    emit(state.copyWith(slider: events.slider));
  }
}

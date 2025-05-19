import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stepper_state.dart';

class StepperCubit extends Cubit<StepperState> {
  StepperCubit() : super(const StepperInitial());

  selectStep(int index){
    emit(StepperLoaded(index));
  }
}

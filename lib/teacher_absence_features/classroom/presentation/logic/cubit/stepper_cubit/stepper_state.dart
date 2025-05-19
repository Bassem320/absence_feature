part of 'stepper_cubit.dart';

@immutable
abstract class StepperState {
  final int stepIndex;
  const StepperState(this.stepIndex);
}

class StepperInitial extends StepperState {
  const StepperInitial(): super(0);
}

class StepperLoaded extends StepperState{
  const StepperLoaded(super.stepIndex);
}

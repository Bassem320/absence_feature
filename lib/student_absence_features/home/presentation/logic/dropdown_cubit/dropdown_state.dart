part of 'dropdown_cubit.dart';

@immutable
abstract class DropdownState<T> {
  final T value;
  const DropdownState(this.value);
}

class DropdownInitial<T> extends DropdownState<T> {
  const DropdownInitial(super.value);
}

class DropdownLoaded<T> extends DropdownState<T>{
  const DropdownLoaded(super.value);
}

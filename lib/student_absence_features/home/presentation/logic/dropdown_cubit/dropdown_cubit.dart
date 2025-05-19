
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dropdown_state.dart';

class DropdownCubit<T> extends Cubit<DropdownState<T>> {
  DropdownCubit(T initialValue) : super(DropdownInitial(initialValue));

  changeValue(T value){
    emit(DropdownLoaded<T>(value));
  }
}

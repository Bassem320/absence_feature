import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'top_navigation_state.dart';

class TopNavigationCubit extends Cubit<TopNavigationState> {
  TopNavigationCubit() : super(const TopNavigationInitial());

  selectScreen(int index){
    emit(TopNavigationLoaded(index));
  }
}

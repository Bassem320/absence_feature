part of 'top_navigation_cubit.dart';

@immutable
abstract class TopNavigationState extends Equatable{
  final int screenIndex;
  const TopNavigationState(this.screenIndex);

  @override
  List<Object> get props => [screenIndex];
}

class TopNavigationInitial extends TopNavigationState {
  const TopNavigationInitial(): super(0);
}

class TopNavigationLoaded extends TopNavigationState{
  const TopNavigationLoaded(super.screenIndex);
}

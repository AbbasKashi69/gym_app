part of 'bottom_nav_bloc.dart';

@immutable
abstract class BottomNavState {}

class BottomNavInitialState extends BottomNavState {}

class BottomNavLoadedState extends BottomNavState {
  final int index;
  BottomNavLoadedState({required this.index});
}

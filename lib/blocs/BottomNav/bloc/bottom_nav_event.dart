part of 'bottom_nav_bloc.dart';

@immutable
abstract class BottomNavEvent {}

class BottomNavLoadingEvent extends BottomNavEvent {
  final int index;
  BottomNavLoadingEvent({required this.index});
}

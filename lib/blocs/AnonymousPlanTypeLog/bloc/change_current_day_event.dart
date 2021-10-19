part of 'change_current_day_bloc.dart';

@immutable
abstract class ChangeCurrentDayEvent {}

class ChangeCurrentDayLoadingEvent extends ChangeCurrentDayEvent {
  final int planId;
  final int? addedDay;
  final int index;
  ChangeCurrentDayLoadingEvent(
      {required this.planId, this.addedDay, required this.index});
}

part of 'change_current_day_diet_bloc.dart';

@immutable
abstract class ChangeCurrentDayDietEvent {}

class ChangeCurrentDayDietLoadingEvent extends ChangeCurrentDayDietEvent {
  final int planId;
  final int? addedDay;
  final int index;
  ChangeCurrentDayDietLoadingEvent(
      {required this.planId, this.addedDay, required this.index});
}

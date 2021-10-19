part of 'change_current_day_body_building_bloc.dart';

@immutable
abstract class ChangeCurrentDayBodyBuildingEvent {}

class ChangeCurrentDayBodyBuildingLoadingEvent
    extends ChangeCurrentDayBodyBuildingEvent {
  final int planId;
  final int? addedDay;
  final int index;
  ChangeCurrentDayBodyBuildingLoadingEvent(
      {required this.planId, this.addedDay, required this.index});
}

part of 'change_current_day_body_building_bloc.dart';

@immutable
abstract class ChangeCurrentDayBodyBuildingState {}

class ChangeCurrentDayBodyBuildingInitialState
    extends ChangeCurrentDayBodyBuildingState {}

class ChangeCurrentDayBodyBuildingLoadingState
    extends ChangeCurrentDayBodyBuildingState {
  final int index;
  ChangeCurrentDayBodyBuildingLoadingState({required this.index});
}

class ChangeCurrentDayBodyBuildingErrorSatte
    extends ChangeCurrentDayBodyBuildingState {
  final String message;
  ChangeCurrentDayBodyBuildingErrorSatte({required this.message});
}

class ChangeCurrentDayBodyBuildingLoadedState
    extends ChangeCurrentDayBodyBuildingState {
  final ResultObject? resultObject;
  ChangeCurrentDayBodyBuildingLoadedState({required this.resultObject});
}

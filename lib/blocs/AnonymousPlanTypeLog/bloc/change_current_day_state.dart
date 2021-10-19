part of 'change_current_day_bloc.dart';

@immutable
abstract class ChangeCurrentDayState {}

class ChangeCurrentDayInitialState extends ChangeCurrentDayState {}

class ChangeCurrentDayLoadingState extends ChangeCurrentDayState {
  final int index;
  ChangeCurrentDayLoadingState({required this.index});
}

class ChangeCurrentDayErrorSatte extends ChangeCurrentDayState {
  final String message;
  ChangeCurrentDayErrorSatte({required this.message});
}

class ChangeCurrentDayLoadedState extends ChangeCurrentDayState {
  final ResultObject? resultObject;
  ChangeCurrentDayLoadedState({required this.resultObject});
}

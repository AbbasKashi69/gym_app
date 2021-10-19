part of 'change_current_day_diet_bloc.dart';

@immutable
abstract class ChangeCurrentDayDietState {}

class ChangeCurrentDayDietInitialState extends ChangeCurrentDayDietState {}

class ChangeCurrentDayDietLoadingState extends ChangeCurrentDayDietState {
  final int index;
  ChangeCurrentDayDietLoadingState({required this.index});
}

class ChangeCurrentDayDietErrorSatte extends ChangeCurrentDayDietState {
  final String message;
  ChangeCurrentDayDietErrorSatte({required this.message});
}

class ChangeCurrentDayDietLoadedState extends ChangeCurrentDayDietState {
  final ResultObject? resultObject;
  ChangeCurrentDayDietLoadedState({required this.resultObject});
}

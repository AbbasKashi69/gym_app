part of 'increase_bloc.dart';

@immutable
abstract class IncreaseState {}

class IncreaseInitialState extends IncreaseState {}

class IncreaseLoadingState extends IncreaseState {}

class IncreaseErrorState extends IncreaseState {
  final String message;
  IncreaseErrorState({required this.message});
}

class IncreaseLoadedState extends IncreaseState {
  final ResultObject? resultObject;
  IncreaseLoadedState({required this.resultObject});
}

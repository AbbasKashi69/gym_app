part of 'change_status_bloc.dart';

@immutable
abstract class ChangeStatusState {}

class ChangeStatusInitialState extends ChangeStatusState {}

class ChangeStatusLoadingState extends ChangeStatusState {
  final int? id;
  ChangeStatusLoadingState({this.id});
}

class ChangeStatusErrorSatte extends ChangeStatusState {
  final String message;
  ChangeStatusErrorSatte({required this.message});
}

class ChangeStatusLoadedState extends ChangeStatusState {
  final ResultObject? resultObject;
  ChangeStatusLoadedState({required this.resultObject});
}

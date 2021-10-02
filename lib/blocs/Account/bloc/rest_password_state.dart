part of 'rest_password_bloc.dart';

@immutable
abstract class RestPasswordState {}

class RestPasswordInitialState extends RestPasswordState {}

class RestPasswordLoadingState extends RestPasswordState {}

class RestPasswordLoadedState extends RestPasswordState {
  final ResultObject? resultObject;
  RestPasswordLoadedState({this.resultObject});
}

class RestPasswordErrorState extends RestPasswordState {
  final String message;
  RestPasswordErrorState({required this.message});
}

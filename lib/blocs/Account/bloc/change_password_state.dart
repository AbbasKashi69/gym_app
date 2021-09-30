part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitialState extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordErrorSatte extends ChangePasswordState {
  final String message;
  ChangePasswordErrorSatte({required this.message});
}

class ChangePasswordLoadedState extends ChangePasswordState {
  final ResultObject? resultObject;
  ChangePasswordLoadedState({required this.resultObject});
}

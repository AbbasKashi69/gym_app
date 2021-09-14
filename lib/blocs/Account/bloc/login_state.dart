part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorSatte extends LoginState {
  final String message;
  LoginErrorSatte({required this.message});
}

class LoginLoadedState extends LoginState {
  final ResultObject? resultObject;
  LoginLoadedState({required this.resultObject});
}

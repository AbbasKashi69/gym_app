part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorSatte extends RegisterState {
  final String message;
  RegisterErrorSatte({required this.message});
}

class RegisterLoadedState extends RegisterState {
  final ResultObject? resultObject;
  RegisterLoadedState({required this.resultObject});
}

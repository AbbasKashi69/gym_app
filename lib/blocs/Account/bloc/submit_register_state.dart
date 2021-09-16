part of 'submit_register_bloc.dart';

@immutable
abstract class SubmitRegisterState {}

class SubmitRegisterInitialState extends SubmitRegisterState {}

class SubmitRegisterLoadingState extends SubmitRegisterState {}

class SubmitRegisterErrorState extends SubmitRegisterState {
  final String message;
  SubmitRegisterErrorState({required this.message});
}

class SubmitRegisterLoadedState extends SubmitRegisterState {
  final ResultObject? resultObject;
  SubmitRegisterLoadedState({this.resultObject});
}

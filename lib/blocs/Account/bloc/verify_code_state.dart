part of 'verify_code_bloc.dart';

@immutable
abstract class VerifyCodeState {}

class VerifyCodeInitialState extends VerifyCodeState {}

class VerifyCodeLoadingState extends VerifyCodeState {}

class VerifyCodeErrorState extends VerifyCodeState {
  final String message;
  VerifyCodeErrorState({required this.message});
}

class VerifyCodeLoadedState extends VerifyCodeState {
  final ResultObject? resultObject;
  VerifyCodeLoadedState({this.resultObject});
}

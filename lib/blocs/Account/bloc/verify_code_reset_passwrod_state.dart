part of 'verify_code_reset_passwrod_bloc.dart';

@immutable
abstract class VerifyCodeResetPasswordState {}

class VerifyCodeResetPasswordInitialState extends VerifyCodeResetPasswordState {
}

class VerifyCodeResetPasswordLoadingState extends VerifyCodeResetPasswordState {
}

class VerifyCodeResetPasswordErrorState extends VerifyCodeResetPasswordState {
  final String message;
  VerifyCodeResetPasswordErrorState({required this.message});
}

class VerifyCodeResetPasswordLoadedState extends VerifyCodeResetPasswordState {
  final ResultObject? resultObject;
  VerifyCodeResetPasswordLoadedState({this.resultObject});
}

part of 'send_code_reset_password_bloc.dart';

@immutable
abstract class SendCodeResetPasswordState {}

class SendCodeResetPasswordInitialState extends SendCodeResetPasswordState {}

class SendCodeResetPasswordLoadingState extends SendCodeResetPasswordState {}

class SendCodeResetPasswordLoadedState extends SendCodeResetPasswordState {
  final ResultObject? resultObject;
  SendCodeResetPasswordLoadedState({this.resultObject});
}

class SendCodeResetPasswordErrorState extends SendCodeResetPasswordState {
  final String message;
  SendCodeResetPasswordErrorState({required this.message});
}

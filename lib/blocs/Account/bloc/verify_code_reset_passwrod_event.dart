part of 'verify_code_reset_passwrod_bloc.dart';

@immutable
abstract class VerifyCodeResetPasswordEvent {}

class VerifyCodeResetPasswordLoadingEvent extends VerifyCodeResetPasswordEvent {
  final ConfirmCodeVm confirmCodeVm;
  final String? username;
  VerifyCodeResetPasswordLoadingEvent(
      {required this.confirmCodeVm, this.username});
}

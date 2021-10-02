part of 'send_code_reset_password_bloc.dart';

@immutable
abstract class SendCodeResetPasswordEvent {}

class SendCodeResetPasswordLoadingEvent extends SendCodeResetPasswordEvent {
  final ForgetPassProviderVm forgetPassProviderVm;
  SendCodeResetPasswordLoadingEvent({required this.forgetPassProviderVm});
}

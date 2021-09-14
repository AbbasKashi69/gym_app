part of 'verify_code_bloc.dart';

@immutable
abstract class VerifyCodeEvent {}

class VerifyCodeLoadingEvent extends VerifyCodeEvent {
  final ConfirmCodeVm confirmCodeVm;
  VerifyCodeLoadingEvent({required this.confirmCodeVm});
}

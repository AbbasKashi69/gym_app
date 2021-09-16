part of 'send_code_bloc.dart';

@immutable
abstract class SendCodeEvent {}

class SendCodeLoadingEvent extends SendCodeEvent {
  final SendCodeVm? sendCodeVm;
  SendCodeLoadingEvent({this.sendCodeVm});
}

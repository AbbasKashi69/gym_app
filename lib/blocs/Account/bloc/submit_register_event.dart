part of 'submit_register_bloc.dart';

@immutable
abstract class SubmitRegisterEvent {}

class SubmitRegisterInitialEvent extends SubmitRegisterEvent {}

class SubmitRegisterLoadingEvent extends SubmitRegisterEvent {
  final RegisterVm registerVm;
  SubmitRegisterLoadingEvent({required this.registerVm});
}

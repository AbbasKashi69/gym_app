part of 'rest_password_bloc.dart';

@immutable
abstract class RestPasswordEvent {}

class RestPasswordLoadingEvent extends RestPasswordEvent {
  final ForgetPasswordVm forgetPasswordVm;
  RestPasswordLoadingEvent({required this.forgetPasswordVm});
}

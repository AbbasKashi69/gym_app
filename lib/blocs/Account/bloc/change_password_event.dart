part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordEvent {}

class ChangePasswordLoadingEvent extends ChangePasswordEvent {
  final SetPasswordVm setPasswordVm;
  ChangePasswordLoadingEvent({required this.setPasswordVm});
}

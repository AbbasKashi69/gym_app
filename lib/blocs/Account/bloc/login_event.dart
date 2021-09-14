part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginLoadingEvent extends LoginEvent {
  final LoginVm loginVm;
  LoginLoadingEvent({required this.loginVm});
}

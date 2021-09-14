part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterLoadingEvent extends RegisterEvent {
  final RegisterVm registerVm;
  RegisterLoadingEvent({required this.registerVm});
}

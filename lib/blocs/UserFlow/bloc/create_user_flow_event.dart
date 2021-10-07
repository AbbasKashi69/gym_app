part of 'create_user_flow_bloc.dart';

@immutable
abstract class CreateUserFlowEvent {}

class CreateUserFlowLoadingEvent extends CreateUserFlowEvent {
  final UserFlowVm userFlowVm;
  CreateUserFlowLoadingEvent({required this.userFlowVm});
}
